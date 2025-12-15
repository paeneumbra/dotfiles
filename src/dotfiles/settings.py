import os
import platform
from pathlib import Path

HOME = Path.home()
XDG_CACHE_DIR = Path(os.getenv("XDG_CACHE_HOME", HOME / ".cache"))
XDG_CONF_DIR = Path(os.getenv("XDG_CONFIG_HOME", HOME / ".config"))

PROJECT_ROOT = Path(__file__).resolve().parents[2]
DATA_DIR = PROJECT_ROOT / ".data"

OS = platform.system()
DISTRO = platform.node()
