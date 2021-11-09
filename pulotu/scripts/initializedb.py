import math
import itertools
import collections

from sqlalchemy.orm import joinedload
from pycldf import Sources
from clldutils.misc import nfilter
from clldutils.color import qualitative_colors
from clldutils.text import strip_brackets
from clld.cliutil import Data, bibtex2source
from clld.db.meta import DBSession
from clld.db.models import common
from clld.lib import bibtex
import colorcet


import pulotu
from pulotu import models


def get_colors(domain):
    colors = ["#fff08d", "#ffbb4e", "#ff0b00", "#b0867f", "#000"]
    if len(domain) == 2:
        return [colors[0], colors[-1]]
    if len(domain) == 3:
        return colors[::2]
    if len(domain) == 4:
        return colors[:2] + colors[-2:]
    if len(domain) == 5:
        return colors
    return qualitative_colors(len(domain))


class ColorMap:
    @staticmethod
    def norm(v):
        if isinstance(v, str) and '-' in v and not v.strip().startswith('-'):
            v = v.split('-')[0].strip()
        try:
            return float(v) if isinstance(v, (str, int)) else v
        except:
            raise ValueError(v)

    def __init__(self, values, log=False):
        values = [self.norm(v) for v in values]
        min_, max_ = min(values), max(values)
        assert max_ > min_
        self.min_ = min_
        self.max_ = max_
        self.log = log and (self.min_ > 0)
        try:
            self.log_min = math.log(min_) if self.log else self.min_
            self.log_max = math.log(max_) if self.log else self.max_
        except:
            print(self.min_, self.max_)
            raise
        self.incr = (self.log_max - self.log_min) / 256.0

    def __call__(self, val):
        val = self.norm(val)
        try:
            val = math.log(val) if self.log else val
        except:
            print(self.log_min, self.log_max)
            print(val)
            raise

        interval = self.log_min
        for i in range(256):
            interval += self.incr
            if val < interval:
                return colorcet.fire[i]
        return colorcet.fire[-1]

    def colorbar(self):
        incr = (self.max_ - self.min_) / 4.0
        return collections.OrderedDict([
            (
                self.min_ + i * incr,
                colorcet.fire[64*i - (0 if i != 4 else 1)]
            ) for i in range(5)
        ])


def index(items, item, default=100):
    if items == models.SECTIONS and item.endswith('Time Focus'):
        return -1
    return items.index(item) if item in items else default


def main(args):
    abbr, title = args.cldf.properties['dc:title'].split(': ')
    data = Data()
    ds = data.add(
        common.Dataset,
        pulotu.__name__,
        id=pulotu.__name__,
        domain='pulotu.org',
        name=abbr,
        description=title,
        publisher_name="Max Planck Institute for Evolutionary Anthropology",
        publisher_place="Leipzig",
        publisher_url="http://www.eva.mpg.de",
        license="http://creativecommons.org/licenses/by/4.0/",
        jsondata={
            'license_icon': 'cc-by.png',
            'license_name': 'Creative Commons Attribution 4.0 International License'},

    )
    data.add(common.Contributor, 'sheehan', id='sheehan', name='Oliver Sheehan')
    data.add(common.Contributor, 'watts', id='watts', name='Joseph Watts')
    for ord, cid in enumerate(['sheehan', 'watts']):
        DBSession.add(common.Editor(ord=ord, dataset=ds, contributor=data['Contributor'][cid]))

    contrib = data.add(
        common.Contribution,
        None,
        id='cldf',
        name=args.cldf.properties.get('dc:title'),
        description=args.cldf.properties.get('dc:bibliographicCitation'),
    )

    for lang in args.cldf.iter_rows('LanguageTable', 'id', 'glottocode', 'name', 'latitude', 'longitude'):
        data.add(
            models.Variety,
            lang['id'],
            id=lang['id'],
            name=lang['name'],
            description=lang['Comment'],
            latitude=lang['latitude'],
            longitude=lang['longitude'],
            glottocode=lang['glottocode'],
            ethonyms='; '.join(lang['Ethonyms']),
            jsondata=dict(ethonyms=lang['Ethonyms'])
        )

    for rec in bibtex.Database.from_file(args.cldf.bibpath, lowercase=True):
        data.add(common.Source, rec.id, _obj=bibtex2source(rec))

    refs = collections.defaultdict(list)

    for row in args.cldf.iter_rows('glossary.csv', 'id', 'name', 'description', 'source'):
        DBSession.add(common.Config(
            key=row['name'],
            value=row['description'],
            jsondata=dict(sources=[sid.replace('-', '') for sid in row['source']])))

    for param in args.cldf.iter_rows('ParameterTable', 'id', 'name'):
        data.add(
            models.Feature,
            param['id'],
            id=param['id'],
            name=param['name'],
            section_notes=param['Section_Notes'],
            datatype=param['Datatype'],
            category=param['Category'],
            section=strip_brackets(param['Section']),
            subsection=param['Subsection'],
            category_ord=index(models.CATEGORIES, param['Category']),
            section_ord=index(models.SECTIONS, param['Section']),
            subsection_ord=index(models.SUBSECTIONS, param['Subsection'], default=-1),
    )
    for pid, codes in itertools.groupby(
        sorted(
            args.cldf.iter_rows('CodeTable', 'id', 'name', 'description', 'parameterReference'),
            key=lambda v: (v['parameterReference'], v['id'])),
        lambda v: v['parameterReference'],
    ):
        codes = [c for c in codes if c['Name'] != '?']
        colors = get_colors(codes)
        for code, color in zip(codes, colors):
            data.add(
                common.DomainElement,
                code['id'],
                id=code['id'],
                name=code['name'],
                description=code['description'],
                parameter=data['Feature'][code['parameterReference']],
                jsondata=dict(color=color),
            )

    for pid, vals in itertools.groupby(
        sorted(
            args.cldf.iter_rows(
                'ValueTable',
                'id', 'value', 'languageReference', 'parameterReference', 'codeReference', 'source'),
            key=lambda r: r['parameterReference']),
        lambda r: r['parameterReference'],
    ):
        vals = [
            v for v in vals if
            (v['value'] is not None) and (v['value'] != '') and (not (v['codeReference'] or '').endswith('-NA'))]
        assert vals
        param = data['Feature'][pid]
        cm = None
        if param.datatype != 'Option':
            cm = ColorMap([v['value'] for v in vals], log=pid in ['3', '4', '8', '10'])
            param.jsondata = dict(colorbar=cm.colorbar())

        for val in vals:
            if param.datatype == 'Option':
                color = data['DomainElement'][val['codeReference']].jsondata['color']
            else:
                try:
                    color = cm(val['value'])
                except:
                    print(val)
                    raise
            assert color, str(val)

            vsid = (val['languageReference'], val['parameterReference'])
            vs = data['ValueSet'].get(vsid)
            if not vs:
                vs = data.add(
                    common.ValueSet,
                    vsid,
                    id='-'.join(vsid),
                    language=data['Variety'][val['languageReference']],
                    parameter=data['Feature'][val['parameterReference']],
                    contribution=contrib,
                )
            for ref in val.get('source', []):
                sid, pages = Sources.parse(ref)
                refs[(vsid, sid)].append(pages)
            data.add(
                common.Value,
                val['id'],
                id=val['id'],
                name=val['value'],
                valueset=vs,
                domainelement=data['DomainElement'].get(val['codeReference']),
                jsondata=dict(color=color),
            )

    for (vsid, sid), pages in refs.items():
        DBSession.add(common.ValueSetReference(
            valueset=data['ValueSet'][vsid],
            source=data['Source'][sid],
            description='; '.join(nfilter(pages))
        ))


def prime_cache(args):
    """If data needs to be denormalized for lookup, do that here.
    This procedure should be separate from the db initialization, because
    it will have to be run periodically whenever data has been updated.
    """
    for l in DBSession.query(common.Language).options(
            joinedload(common.Language.valuesets).joinedload(common.ValueSet.references)):
        spks = set(itertools.chain(*[[ref.source_pk for ref in vs.references] for vs in l.valuesets]))
        for spk in spks:
            DBSession.add(common.LanguageSource(language_pk=l.pk, source_pk=spk))
