from sqlalchemy.orm import joinedload
from clld.db.util import get_distinct_values
from clld.db.models import common
from clld.web import datatables
from clld.web.datatables.base import LinkCol, Col, LinkToMapCol
from clld.web.datatables.parameter import Parameters
from clld.web.datatables.value import Values

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
    def get_options(self):
        opts = super(Questions, self).get_options()
        opts['aaSorting'] = [[0, 'asc'], [1, 'asc'], [2, 'asc']]
        return opts

    def col_defs(self):
        return [
            CategoryCol(self, 'category', model_col=models.Feature.category, choices=get_distinct_values(models.Feature.category)),
            SectionCol(self, 'section', model_col=models.Feature.section, choices=get_distinct_values(models.Feature.section)),
            SubsectionCol(self, 'subsection', model_col=models.Feature.subsection),
            LinkCol(self, 'name'),
        ]


class Responses(Values):
    def col_defs(self):
        res = Values.col_defs(self)
        if self.parameter:
            res[0].button_text = 'notes'
            return res + [
                #Col(self, 'notes', model_col=common.Value.description),
                Col(self, 'confidence', model_col=common.Value.confidence, choices=get_distinct_values(common.Value.confidence)),
            ]
        return res


def includeme(config):
    config.register_datatable('languages', Cultures)
    config.register_datatable('parameters', Questions)
    config.register_datatable('values', Responses)
