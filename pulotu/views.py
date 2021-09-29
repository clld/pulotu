import itertools
import collections

from clld.db.models import common
from clld.db.meta import DBSession


def glossary(req, ctx):
    res = collections.OrderedDict()
    for initial, terms in itertools.groupby(
        DBSession.query(common.Config).order_by(common.Config.key),
        lambda o: o.key[0],
    ):
        res[initial] = [(t.key, t.value) for t in terms]
    return {'terms': res}
