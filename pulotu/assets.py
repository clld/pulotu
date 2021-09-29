from pathlib import Path

from clld.web.assets import environment

import pulotu


environment.append_path(
    Path(pulotu.__file__).parent.joinpath('static').as_posix(),
    url='/pulotu:static/')
environment.load_path = list(reversed(environment.load_path))
