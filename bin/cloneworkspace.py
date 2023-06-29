#!/usr/bin/env python3

"""
Generates `git clone` commands based on given input file.
Uses name to define the directory and subdirectories.

Input json file should be in the following structure:
{
  "name": "folder",
  "repos": [
    "git@github.com:someone/other-stuff.git",
    ...,
    {
      "name": "sub-folder-one",
      "repos": [
        "git@github.com:someone/one.git",
        "ssh@bitbucket.com:someone/another-one.git",
        ...
        {
            ...
        }
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

__version__ = '0.3.1'

from typing import Dict, Any

parser = ArgumentParser()


def define_arguments():
    """
    Define allowed arguments.
    Refer to https://docs.python.org/3/library/argparse.html for documentation
    """
    parser.add_argument(
        '-v', '--version', action='version', version='%(prog)s ' + __version__
    )
    parser.add_argument(
        '-s', '--source', type=str, help='JSON configuration file', required=True
    )
    parser.add_argument(
        '-r',
        '--run',
        action='store_true',
        default=False,
        help='Execute commands - will attempt to create git repos',
    )


def get_arguments() -> Dict[str, Any]:
    """The handling of parameters from the command line"""

    args, unknowns = parser.parse_known_args()

    if args.source is not None and not os.path.exists(args.source):
        sys.exit(f'File not found: {args.source}')

    if type(args) == Namespace:
        args = vars(args)
    print(f'Arguments: {args}')
    return args


HOME = os.getenv('HOME')


def read_json(filepath: str):
    """Returns a json object from given file"""
    with open(filepath) as read_file:
        try:
            json_file = json.load(read_file)
        except ValueError as err:
            sys.exit(f'Failure reading file: {err}')
    return json_file


def parse_repositories(json_obj: json, directory: str = ''):
    """
    Returns a flat dict composed of directory and repository lists based on json structure.
    Directory is a composite of root node plus subdirectory, if it exists.
    """
    repository_dt = {}
    directory = f"{directory}/{json_obj['name']}" if directory else json_obj['name']

    for value in (x for x in json_obj['repos']):
        if isinstance(value, dict):
            repository_dt.update(parse_repositories(value, directory))
        else:
            repository_dt.setdefault(directory, []).append(value)

    return repository_dt


def create_commands(repository_structure: dict, destination: str):
    """
    Creates git clone command for all git repositories in a given dict
    generating a destination folder based on given arguments and
    git repository name

    If destination folder exists, does not clone that repository

    Returns string commands for cloning
    """
    commands = []
    for folder in repository_structure:
        for repo in repository_structure[folder]:
            name = repo.split('.git')[0].split('/')[-1]
            directory = f'{destination}/{folder}/{name}'
            if os.path.exists(directory):
                print(f'\n[WARN] {directory} exists, repo will not be cloned')
            else:
                commands.append(f'git clone {repo} {destination}/{folder}/{name}')
    return commands


def execute_commands(commands: list, run_command: bool = False):
    """Executes passed command list"""
    for command in commands:
        print(f'\n[COMMAND] {command}')
        if run_command:
            os.system(command)


define_arguments()
arguments = get_arguments()

json_object = read_json(arguments.get('source'))
repos = parse_repositories(json_object)
command_list = create_commands(repos, f'{HOME}')

execute_commands(command_list, arguments.get('run'))
