from clld.db.meta import DBSession
from clld.db.models import common


def dataset_detail_html(request=None, context=None, **kw):
    return {"ncultures": DBSession.query(common.Language).count()}
