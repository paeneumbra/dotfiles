#!/usr/bin/env python3

"""
Decorate environment using templates with provided colorscheme.
Color schemes can be exported as json from terminal.sexy, examples can be found under decorate/colorschemes.

This script loads a json source file, used to replace in memory the {{variables}} for all files inside
decorator/template folder and replacing decorator/output resources.

Alacritty will reload the colors automatically, xresources and awesomewm are reloaded via command.


Template files:
* Xresources
* rofi
* alacritty

"""

import argparse
import glob
import json
import os
import sys

__version__ = "3.0.1"

HOME = os.getenv("HOME")
DECORATOR = f"{os.getenv('XDG_CONFIG_HOME', os.path.join(HOME, '.config'))}/decorator"
COLORSCHEMES = f"{DECORATOR}/colorschemes"
TEMPLATE_DIR = f"{DECORATOR}/templates"
OUTPUT_DIR = f"{DECORATOR}/output"


def define_arguments():
    """
    Define allowed arguments.
    Refer to https://docs.python.org/3/library/argparse.html for documentation
    """
    parser = argparse.ArgumentParser("Decorate environment")
    parser.add_argument(
        "-v", "--version", action="version", version="%(prog)s " + __version__
    )
    parser.add_argument(
        "-s",
        "--source",
        type=str,
        help="Full path to JSON configuration file",
        required=False,
    )
    parser.add_argument(
        "-c",
        "--colorscheme",
        type=str,
        help="colorcheme name",
        required=False,
    )
    parser.add_argument(
        "-d",
        "--dark",
        action='store_true',
        help="Defaults to gruvbox dark JSON colorscheme",
    )
    parser.add_argument(
        "-l",
        "--light",
        action='store_true',
        help="Defaults to gruvbox light JSON colorscheme",
    )
    parser.add_argument(
        "--list",
        action='store_true',
        help="Defaults to nordic JSON colorscheme",
    )
    return parser


def parse_args(parser: argparse.ArgumentParser):
    """Process command line arguments"""
    args = parser.parse_args()

    if len(sys.argv) <= 1:
        sys.exit(f'No arguments given, run decorate -h')

    if args.light:
        return colorscheme("gruvbox-light")

    if args.dark:
        return colorscheme("gruvbox-dark")

    if args.list:
        return decorator_colorschemes()

    if args.colorscheme:
        return colorscheme(args.colorscheme)

    elif args.source:
        return assert_file_exists(args.source)


def assert_directory_exists(directory):
    if os.path.exists(directory) is False:
        sys.exit(f"{directory} does not exist")
    if not os.listdir(directory):
        sys.exit(f"{directory} is empty")


def assert_file_exists(colorscheme):
    if colorscheme is None or os.path.exists(colorscheme) is False:
        sys.exit(f"{colorscheme} does not exist")
    return colorscheme


def decorator_colorschemes():
    """Print all available color schemes"""
    for scheme in glob.glob(f"{COLORSCHEMES}/*"):
        print(os.path.splitext(os.path.basename(scheme))[0])
    sys.exit()


def colorscheme(name: str):
    """Gets all colorscheme in decorator and validates the given input corresponds to a filename"""
    colorscheme_path = None
    for scheme in glob.glob(f"{COLORSCHEMES}/*"):
        filename = os.path.splitext(os.path.basename(scheme))[0]
        if name == filename:
            colorscheme_path = scheme
    if colorscheme_path is not None:
        return colorscheme_path
    else:
        sys.exit(f"Colorscheme {name} is not present in decorator folder")


def terminal_sexy_json(json_colorscheme) -> json:
    with open(json_colorscheme) as json_file:
        return json.load(json_file)


def parse_colors(json_file: dict) -> dict:
    """Parse terminal sexy colorscheme"""

    terminal_sexy = {
        "foreground": json_file["foreground"],
        "background": json_file["background"],
    }

    for index, color in enumerate(json_file["color"]):
        terminal_sexy[f"color{index}"] = color

    return terminal_sexy


def get_lines(filename: str) -> list:
    with open(filename, "rt") as data:
        return list(data)


def replace_template(line: str, colorscheme_dict: dict) -> str:
    """Replace {variables} in template line"""
    for key, value in colorscheme_dict.items():
        handlebars = "{{%s}}" % key
        if handlebars in line:
            new_line = line.replace(handlebars, value)
            return new_line
    return line


def replace_colors(lines: list, colorscheme_dict: dict) -> list:
    new_lines = []
    for line in lines:
        res = replace_template(line, colorscheme_dict)
        new_lines.append(res)
    return new_lines


def write_new_file(filepath: str, lines: list):
    filename = os.path.basename(filepath)
    schema = open(f"{OUTPUT_DIR}/{filename}", "w", newline="", encoding="utf-8")
    for entry in lines:
        schema.write(entry)


def reload_xresources():
    os.system(f"xrdb {HOME}/.Xresources")


def reload_awesome():
    os.system("echo 'awesome.restart()' | awesome-client")


assert_directory_exists(TEMPLATE_DIR)
assert_directory_exists(OUTPUT_DIR)
assert_directory_exists(COLORSCHEMES)

template_files = glob.glob(f"{TEMPLATE_DIR}/*")
arguments = define_arguments()
parsed_arguments = parse_args(arguments)

parsed_colorscheme = parse_colors(terminal_sexy_json(parsed_arguments))

for path in template_files:
    file_lines = get_lines(path)
    new_file_lines = replace_colors(file_lines, parsed_colorscheme)
    write_new_file(path, new_file_lines)

reload_xresources()
reload_awesome()
