import os
import platform

HOME = os.getenv("HOME", os.getenv("USERPROFILE"))
XDG_CACHE_DIR = os.getenv("XDG_CACHE_HOME", os.path.join(HOME, ".cache"))
XDG_CONF_DIR = os.getenv("XDG_CONFIG_HOME", os.path.join(HOME, ".config"))

MODULE_DIR = os.path.dirname(__file__)
DATA_DIR = os.path.join(MODULE_DIR, ".data")

OS = platform.uname()[0]
DISTRO = platform.uname()[1]

# print(HOME)
# print(XDG_CACHE_DIR)
# print(XDG_CONF_DIR)
# print(MODULE_DIR)
# print(DATA_DIR)
# print(OS)
# print(DISTRO)
