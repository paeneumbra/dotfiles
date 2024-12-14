#!/usr/bin/env python3

import os
import sys
from argparse import ArgumentParser, Namespace

__version__ = "0.1.0"

from typing import Dict, Any

parser = ArgumentParser()


def define_arguments():
    parser.add_argument(
        "-v", "--version", action="version", version="%(prog)s " + __version__
    )
    parser.add_argument(
        "-s", "--source", type=str, help="Alias script file to load", required=True
    )
    parser.add_argument(
        "-r",
        "--run",
        action="store_true",
        default=False,
        help="Will generate a file",
    )


def get_arguments() -> Dict[str, Any]:
    """The handling of parameters from the command line"""
    args, unknowns = parser.parse_known_args()

    if args.source is not None and not os.path.exists(args.source):
        sys.exit(f"File not found: {args.source}")
    if type(args) is Namespace:
        args = vars(args)

    print(f"Arguments: {args}")
    return args


def read_file(filepath: str):
    """Returns a yaml object from given file"""
    with open(filepath) as file:
        try:
            lines = file.readlines()
        except FileNotFoundError:
            print(f"Error: The file '{filepath}' was not found.")
        except Exception as e:
            print(f"An error occurred: {e}")
    return lines


def convert_to_abbr(filepath):
    lines = read_file(filepath)
    fish_abbrs = []

    for line in lines:
        line = line.strip()
        if line.startswith("alias"):
            parts = line.split("=", 1)
            alias_name = parts[0].split()[1]
            command = parts[1].strip()
            fish_abbrs.append(f"abbr --add {alias_name} {command}")

    for abbr in fish_abbrs:
        print(abbr)

    return fish_abbrs


def create_file(filepath, abbrs):
    base_name = os.path.splitext(filepath)[0]  # Get the base name without extension
    output = f"{base_name}.fish"
    with open(output, "w") as output_file:
        output_file.write("\n".join(abbrs) + "\n")
    return output


def handle_outcome(abbrs: list, source, run_command: bool = False):
    if run_command:
        create_file(source, abbrs)
    else:
        for abbr in abbrs:
            print(abbr)


def main(args):
    source = args.get("source")
    abbrs = convert_to_abbr(source)
    handle_outcome(abbrs, source, args.get("run"))


if __name__ == "__main__":
    define_arguments()
    arguments = get_arguments()
    main(arguments)
