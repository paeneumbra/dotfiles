#!/usr/bin/env python3

# This script flattens a json file based on terminal.sexy export
# It expects the path to the source filename and creates a new color scheme json file,
# if it doesn't exist, in resources folder with origin file name

import json
import os

import sys

__version__ = "2.1.0"

from argparse import ArgumentParser, Namespace
from typing import Dict, Any

parser = ArgumentParser()


def define_arguments():
    """
    Define allowed arguments.
    Refer to https://docs.python.org/3/library/argparse.html for documentation
    """
    parser.add_argument(
        "-v", "--version", action="version", version="%(prog)s " + __version__
    )
    parser.add_argument(
        "-s",
        "--source",
        type=str,
        help="Path to JSON configuration file",
        required=True,
    )


def get_arguments() -> Dict[str, Any]:
    """The handling of parameters from the command line"""

    args, unknowns = parser.parse_known_args()

    print(args)

    if args.source is not None:
        if not os.path.exists(args.source):
            sys.exit(f"File not found: {args.source}")

    if type(args) == Namespace:
        args = vars(args)
    print(f"Arguments: {args}")
    return args


HOME = os.getenv("HOME")

define_arguments()
arguments = get_arguments()
source_file = arguments.get("source")

# I need a better way to get just the filename (without path)
filename = os.path.basename(os.path.splitext(source_file)[0])
destination_file = f"{HOME}/workspace/python/resources/{filename}.json"
if os.path.exists(destination_file) is True:
    sys.exit(f"File {destination_file} already exists!")

lines = {}

with open(source_file, "rt") as file:
    d = json.load(file)
    for k, v in d.items():
        if isinstance(v, list):
            for index in range(len(v)):
                lines[f"color{index}"] = v[index]
        elif k == "name":
            if v == "":
                lines[k] = source_file
            else:
                lines[k] = v
        else:
            lines[k] = v

print(lines)

with open(destination_file, "x", encoding="utf-8") as entries:
    json.dump(lines, entries, indent=2)
