#!/usr/bin/env python3

"""
This script will generate and execute git clone commands from a given
json file containing git urls.
It expects an input json file with following structure:
{
  "main": "main-folder",
  "repos": [
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
    },
    "git@github.com:someone/other-stuff.git",
    ...
  ]
}
This script also requires environment variable $HOME to be defined
"""

import json
import os
import sys

if len(sys.argv) != 2:
    sys.exit(
        f"Source filename argument were expected,"
        f"instead {len(sys.argv)} arguments were found"
    )

REPO_FILE = sys.argv[1]
if os.path.exists(REPO_FILE) is False:
    sys.exit(f"File {REPO_FILE} is not present!")

HOME = os.getenv("HOME")


def get_json_object(filepath: str):
    """Returns a json object from given file"""
    file = open(filepath)
    return json.load(file)


def get_repositories_structure(json_object: json):
    """
    Returns dict composed of directory and repository based on json structure.
    Directory is a composite of root node plus subdirectory, if it exists.
    """

    repository_dt = {}
    base_repositories = []
    base_folder = json_object["main"]

    for sub_dir in json_object["repos"][:]:
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


jo = get_json_object(REPO_FILE)
main_dir = jo["main"]
repos = get_repositories_structure(jo)
command_list = create_commands(repos, f"{HOME}")

print("Commands to execute:")
for index, command in enumerate(command_list):
    print(f"Cloning repo {index + 1}: {command}")
    # os.system(command)
