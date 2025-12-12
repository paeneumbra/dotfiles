import os
import platform
from pathlib import Path

HOME = os.getenv("HOME") or os.getenv("USERPROFILE") or str(Path.home())
XDG_CACHE_DIR = os.getenv("XDG_CACHE_HOME", os.path.join(HOME, ".cache"))
XDG_CONF_DIR = os.getenv("XDG_CONFIG_HOME", os.path.join(HOME, ".config"))

MODULE_DIR = os.path.dirname(__file__)
DATA_DIR = os.path.join(MODULE_DIR, ".data")

OS = platform.uname()[0]
DISTRO = platform.uname()[1]
