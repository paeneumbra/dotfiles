import os
from pathlib import Path

from dotenv import load_dotenv

from dotfiles.settings import OS, HOME
from dotfiles.settings import PROJECT_ROOT

load_dotenv()


class TestSettings:
    def test_os(self):
        assert OS == "Darwin" or OS == "Linux"

    def test_home(self):
        assert Path(HOME) == Path.home()

    def test_project_root(self):
        assert PROJECT_ROOT.name == "dotfiles"

    def test_xdg_config_home(self):
        assert Path(f"{HOME}/.config") == Path(os.environ["XDG_CONFIG_HOME"])

    def test_xdg_cache_home(self):
        assert Path(f"{HOME}/.cache") == Path(os.environ["XDG_CACHE_HOME"])
