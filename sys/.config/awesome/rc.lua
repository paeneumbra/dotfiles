--                                                   _     _            _
--   __ ___      _____  ___  ___  _ __ ___   ___    | |__ | | __ _  ___| | __
--  / _` \ \ /\ / / _ \/ __|/ _ \| '_ ` _ \ / _ \___| '_ \| |/ _` |/ __| |/ /
-- | (_| |\ V  V /  __/\__ \ (_) | | | | | |  __/___| |_) | | (_| | (__|   <
--  \__,_| \_/\_/ \___||___/\___/|_| |_| |_|\___|   |_.__/|_|\__,_|\___|_|\_\
--
-- Arch: https://wiki.archlinux.org/title/Awesome
-- Awesome: https://awesomewm.org/apidoc/index.html

pcall(require, "luarocks.loader")
--
require("awful.autofocus")
--
require("error_handler")
require("startup")
require("settings")
require("theme")
require("interface")
require("signals")
require("rules")
require("layout")
require("bindings")
require("tags")
--
