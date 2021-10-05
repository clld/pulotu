from sqlalchemy.orm import joinedload
from clld.db.util import get_distinct_values
from clld.web import datatables
from clld.web.datatables.base import LinkCol, Col, LinkToMapCol
from clld.web.datatables.parameter import Parameters

from pulotu import models


class Languages(datatables.Languages):
    def col_defs(self):
        return [
            LinkCol(self, 'name'),
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


def includeme(config):
    config.register_datatable('languages', Languages)
    config.register_datatable('parameters', Questions)
