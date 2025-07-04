from pathlib import Path
import toml
from dotfiles.version import __version__


def test_version():
    with Path("pyproject.toml").open(encoding="utf8") as toml_file:
        pyproject_toml = toml.load(toml_file)

    project_version = pyproject_toml["project"]["version"]
    package_version = __version__
    assert f"v{project_version}" == package_version
