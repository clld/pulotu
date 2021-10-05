import collections
import itertools

from zope.interface import implementer
from sqlalchemy import (
    Column,
    String,
    Unicode,
    Integer,
    Boolean,
    ForeignKey,
    UniqueConstraint,
)
from sqlalchemy.orm import relationship, backref
from sqlalchemy.ext.declarative import declared_attr
from sqlalchemy.ext.hybrid import hybrid_property

from clld import interfaces
from clld.db.meta import Base, CustomModelMixin
from clld.db.models import common


#-----------------------------------------------------------------------------
# specialized common mapper classes
#-----------------------------------------------------------------------------
CATEGORIES = [
    'Traditional Culture',
    'Post Contact History',
    'Current Culture',
]
SECTIONS = [
    'Belief (Current)',
    'Religious History',
    'Secular History',
    'Belief (Indigenous)',
    'Isolation',
    'Physical Environment',
    'Practice (Indigenous)',
    'Social Environment',
    'Subsistence and Economy',
]
SUBSECTIONS = [
    'Supernatural Beings',
    'Supernatural Punishment',
    'Afterlife and Creation',
    'General Features (Indigenous Belief)',
    'Classes of Tapu',
    'Mana',
    'General Supernatural Practices (Indigenous)',
    'Rites',
    'Conflict',
    'Land-based means of subsistence',
    'Water-based means of subsistence',
    'Commercial Activity',
    'Geographical Range of Culture',
    'Features of Island with Largest Culture Population',
    'Conversion',
    'Syncretic Movements',
    'Demographic and Social Changes',
    'Economic Changes',
    'Modern Infrastructure',
    'Loss of Autonomy',
    'Religious Demographics',
]


def parameter_sort(parameter):
    cat = parameter.category
    sec = parameter.section
    subsec = parameter.subsection
    return (
        CATEGORIES.index(cat) if cat in CATEGORIES else 100,
        SECTIONS.index(sec) if sec in SECTIONS else 100,
        SUBSECTIONS.index(subsec) if subsec in SUBSECTIONS else 0
    )


@implementer(interfaces.ILanguage)
class Variety(CustomModelMixin, common.Language):
    pk = Column(Integer, ForeignKey('language.pk'), primary_key=True)
    glottocode = Column(Unicode)

    @property
    def contemporary_time_focus(self):
        for vs in self.valuesets:
            if vs.parameter.name == 'Contemporary Time Focus':
                return vs.values[0].name

    @property
    def traditional_state_time_focus(self):
        for vs in self.valuesets:
            if vs.parameter.name == 'Traditional State Time Focus':
                return vs.values[0].name

    def grouped_valuesets(self):
        res = collections.OrderedDict()
        lastcat, lastsec = None, None
        for (cat, sec, subsec), vals in itertools.groupby(
            sorted(self.valuesets, key=lambda vs: parameter_sort(vs.parameter)),
            lambda vs: (vs.parameter.category, vs.parameter.section, vs.parameter.subsection)
        ):
            vals = [val for val in vals if not val.parameter.name.endswith('Time Focus')]
            if vals and (cat in CATEGORIES) and (sec in SECTIONS):
                if cat != lastcat:
                    if cat == CATEGORIES[0]:
                        date = self.traditional_state_time_focus
                    elif cat == CATEGORIES[1]:
                        date = '{}-{}'.format(self.traditional_state_time_focus, self.contemporary_time_focus)
                    else:
                        date = self.contemporary_time_focus
                    res[cat] = (date, collections.OrderedDict())
                    lastcat = cat
                if sec != lastsec:
                    res[cat][1][sec] = collections.OrderedDict()
                    lastsec = sec
                res[cat][1][sec][subsec] = vals
        return res


@implementer(interfaces.IParameter)
class Feature(CustomModelMixin, common.Parameter):
    pk = Column(Integer, ForeignKey('parameter.pk'), primary_key=True)
    datatype = Column(Unicode)
    category = Column(Unicode)
    section = Column(Unicode)
    subsection = Column(Unicode)
    category_ord = Column(Integer)
    section_ord = Column(Integer)
    subsection_ord = Column(Integer)
