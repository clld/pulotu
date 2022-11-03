from clld.web.maps import Map, ParameterMap


class LanguagesMap(Map):
    def get_options(self):
        return {
            'max_zoom': 13,
            #'show_labels': True,
            'resize_direction': 's',
        }


class QuestionMap(ParameterMap):
    def get_options(self):
        return {
            'max_zoom': 13,
            #'show_labels': True,
            'resize_direction': 's',
        }


def includeme(config):
    config.register_map('languages', LanguagesMap)
    config.register_map('parameter', QuestionMap)
