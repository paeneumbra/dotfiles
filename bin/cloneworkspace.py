#!/usr/bin/env python3

"""
Generates `git clone` commands based on given input file.
Input file should contain a tag specifying the main directory
where all repositories will be created.

Input json file should following structure:
{
  "main": "main-folder",
  "repos": [
    "git@github.com:someone/other-stuff.git",
    ...,
    {
      "name": "sub-folder-one",
      "repos": [
        "git@github.com:someone/one.git",
        "ssh@bitbucket.com:someone/another-one.git",
        ...
      ]
    },
    {
        ...
    }
  ]
}

Environment variable $HOME must be defined.
"""
import json
import os
import sys
from argparse import ArgumentParser, Namespace

__version__ = '2.1'

from typing import Dict, Any

parser = ArgumentParser()


def define_arguments():
    """
    Define allowed arguments.
    Refer to https://docs.python.org/3/library/argparse.html for documentation
    """
    parser.add_argument("-v", "--version", action="version", version="%(prog)s " + __version__)
    parser.add_argument("-s", "--source", type=str, help="JSON configuration file", required=True)
    parser.add_argument("-r", "--run", action="store_true", default=False,
                        help="Execute commands - will attempt to create git repos")


def get_arguments() -> Dict[str, Any]:
    """ The handling of parameters from the command line"""

    args, unknowns = parser.parse_known_args()

    if args.source is not None and not os.path.exists(args.source):
        sys.exit(f"File not found: {args.source}")

    if type(args) == Namespace:
        args = vars(args)
    print(f"Config: {args}")
    return args


HOME = os.getenv("HOME")


def parse_json(filepath: str):
    """Returns a json object from given file"""
    read_file = open(filepath)
    try:
        json_file = json.load(read_file)
    except ValueError as err:
        sys.exit(f"Failure reading file: {err}")
    return json_file


def get_repositories_structure(json_obj: json):
    """
    Returns dict composed of directory and repository based on json structure.
    Directory is a composite of root node plus subdirectory, if it exists.
    """
    repository_dt = {}
    base_repositories = []
    base_folder = json_obj["main"]

    for sub_dir in json_obj["repos"][:]:
        if isinstance(sub_dir, dict):
            folder = f'{base_folder}/{sub_dir["name"]}'
            repository_dt[folder] = sub_dir["repos"]
        else:
            base_repositories.append(sub_dir)

    repository_dt[base_folder] = base_repositories
    return repository_dt


def create_commands(repository_structure: dict, destination: str):
    """
    Creates git clone command for all git repositories in a given dict
    generating a destination folder based on given arguments and
    git repository name

    Returns string commands for cloning
    """
    commands = []
    for folder in repository_structure:
        for repo in repository_structure[folder]:
            name = repo.split(".git")[0].split("/")[-1]
            commands.append(f"git clone {repo} {destination}/{folder}/{name}")
    return commands


def execute_commands(commands: list, execute_command: bool):
    print("Commands to execute:")
    for index, command in enumerate(commands):
        print(f"Repo {index + 1}: {command}")
        if execute_command:
            os.system(command)


define_arguments()
arguments = get_arguments()

json_object = parse_json(arguments.get("source"))
repos = get_repositories_structure(json_object)
command_list = create_commands(repos, f"{HOME}")
execute_commands(command_list, arguments.get("run"))
