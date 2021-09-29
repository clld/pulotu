from sqlalchemy.orm import joinedload
from clld.web import datatables
from clld.web.datatables.base import LinkCol, Col, LinkToMapCol


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



def includeme(config):
    """register custom datatables"""

    config.register_datatable('languages', Languages)
