import functools

from pyramid.config import Configurator

from clld.interfaces import IMapMarker, IValueSet, IValue, IDomainElement
from clld.web.icon import MapMarker
from clld.web.app import menu_item
from clldutils.svg import pie, icon, data_url

# we must make sure custom models are known at database initialization!
from pulotu import models
from pulotu import views

_ = lambda s: s
_('Language')
_('Languages')
_('Parameter')
_('Parameters')


class LanguageByFamilyMapMarker(MapMarker):
    def __call__(self, ctx, req):
        if IValueSet.providedBy(ctx):
            return data_url(icon(ctx.values[0].jsondata['color'].replace('#', 'c')))
        if IDomainElement.providedBy(ctx):
            return data_url(icon(ctx.jsondata['color'].replace('#', 'c')))
        if IValue.providedBy(ctx):
            return data_url(icon(ctx.jsondata['color'].replace('#', 'c')))

        return super(LanguageByFamilyMapMarker, self).__call__(ctx, req)


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    settings['route_patterns'] = {
        'languages': r'/culture/',
        'language': r'/culture/{id:[^/\.]+}',
        'parameters': '/compare/',
        'parameter': r'/compare/{id:[^/\.]+}',
    }
    config = Configurator(settings=settings)
    config.include('clld.web.app')

    config.include('clldmpg')
    config.register_menu(
        ('dataset', functools.partial(menu_item, 'dataset', label='Home')),
        ('about', functools.partial(menu_item, 'about', label='About')),
        ('languages', functools.partial(menu_item, 'languages', label='Cultures')),
        ('parameters', functools.partial(menu_item, 'parameters', label='Compare Cultures')),
        ('sources', functools.partial(menu_item, 'sources', label='Sources')),
        ('glossary', functools.partial(menu_item, 'glossary', label='Glossary')),
    )

    config.add_route_and_view('glossary', '/glossary', views.glossary, renderer='glossary.mako')
    config.registry.registerUtility(LanguageByFamilyMapMarker(), IMapMarker)

    return config.make_wsgi_app()
