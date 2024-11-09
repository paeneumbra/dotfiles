from pathlib import Path
import toml
from anvil.version import __version__


def test_version():
    with Path("pyproject.toml").open(encoding="utf8") as toml_file:
        pyproject_toml = toml.load(toml_file)

    poetry_version = pyproject_toml["tool"]["poetry"]["version"]
    package_version = __version__
    assert f"v{poetry_version}" == package_version
