from sqlalchemy.orm import joinedload
from clld.db.util import get_distinct_values
from clld.db.models import common
from clld.web import datatables
from clld.web.datatables.base import LinkCol, Col, LinkToMapCol, DetailsRowLinkCol
from clld.web.datatables.parameter import Parameters
from clld.web.datatables.value import Values, ValueNameCol, RefsCol, ValueSetCol
from clldutils.misc import dict_merged, slug

from pulotu import models


class Cultures(datatables.Languages):
    def get_options(self):
        opts = datatables.Languages.get_options(self)
        opts['iDisplayLength'] = 150
        return opts

    def col_defs(self):
        return [
            LinkCol(self, 'name'),
            Col(self, 'ethonyms', model_col=models.Variety.ethonyms),
            Col(self,
                'latitude',
                sDescription='<small>The geographic latitude</small>'),
            Col(self,
                'longitude',
                sDescription='<small>The geographic longitude</small>'),
            LinkToMapCol(self, 'm'),
        ]


class CategoryCol(Col):
    def order(self):
        return models.Feature.category_ord


class SectionCol(Col):
    def order(self):
        return models.Feature.section_ord


class SubsectionCol(Col):
    def order(self):
        return models.Feature.subsection_ord


class Questions(Parameters):
    def __init__(self, req, model, **kw):
        self.focus = kw.pop('focus', req.params.get('focus', None))
        if self.focus:
            kw['eid'] = 'dt-parameters-' + slug(self.focus)
        super(Questions, self).__init__(req, model, **kw)


    def xhr_query(self):
        return dict_merged(super(Questions, self).xhr_query(), focus=self.focus)

    def base_query(self, query):
        if self.focus:
            query = query.filter(models.Feature.category == self.focus)
        return query

    def get_options(self):
        opts = super(Questions, self).get_options()
        opts['aaSorting'] = [[0, 'asc'], [1, 'asc'], [2, 'asc']]
        return opts

    def col_defs(self):
        return [
            #CategoryCol(self, 'category', model_col=models.Feature.category, choices=get_distinct_values(models.Feature.category)),
            SectionCol(self, 'section', model_col=models.Feature.section, choices=get_distinct_values(models.Feature.section)),
            SubsectionCol(self, 'subsection', model_col=models.Feature.subsection),
            LinkCol(self, 'name'),
        ]


class ResponseCol(ValueNameCol):
    def format(self, item):
        return self.get_attrs(item)['label']


class Responses(Values):
    def col_defs(self):
        name_col = ResponseCol(self, 'value')
        if self.parameter and self.parameter.domain:
            name_col.choices = [de.name for de in self.parameter.domain]

        res = []

        if self.parameter:
            res = res + [
                LinkCol(self,
                        'language',
                        model_col=common.Language.name,
                        get_object=lambda i: i.valueset.language),
                name_col,
                RefsCol(self, 'source'),
                LinkToMapCol(self, 'm', get_object=lambda i: i.valueset.language),
            ]
            if self.parameter.id in ['84', '85', '86']:
                res.append(DetailsRowLinkCol(self, 'comment', button_text='comment'))
            return res

        if self.language:
            return res + [
                name_col,
                LinkCol(self,
                        'parameter',
                        sTitle=self.req.translate('Parameter'),
                        model_col=common.Parameter.name,
                        get_object=lambda i: i.valueset.parameter),
                RefsCol(self, 'source'),
            ]

        return res + [
            name_col,
            ValueSetCol(self, 'valueset', bSearchable=False, bSortable=False),
        ]


def includeme(config):
    config.register_datatable('languages', Cultures)
    config.register_datatable('parameters', Questions)
    config.register_datatable('values', Responses)
