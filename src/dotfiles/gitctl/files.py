import os
import re

import click


def map_directory_to_repositories(repo_dict: dict, parent=""):
    result = {}

    for key, value in repo_dict.items():
        current_path = f"{parent}/{key}" if parent else key

        items = value if isinstance(value, list) else [value]

        for item in items:
            if isinstance(item, str) and validate_repository_string(item):
                result.setdefault(current_path, []).append(item)
            elif isinstance(item, dict):
                nested = map_directory_to_repositories(item, current_path)
                for path, repos in nested.items():
                    result.setdefault(path, []).extend(repos)

    return result


def validate_repository_string(repo_string: str) -> bool:
    git_pattern = r"^git@.*:.*\.git$"
    return bool(re.match(git_pattern, repo_string, re.IGNORECASE))


def is_valid_path(path):
    """
    Checks if a given file path is valid.

    This function uses a regular expression to validate the provided file
    path. It ensures the path does not contain invalid characters
    (such as null characters or colons) and avoids referencing
    parent directories ('..').

    Regex Breakdown:
    ^               : Start of string
    (?!.*[\\:\0])   : Fail if it contains Backslash (\), Colon (:), or Null (\0)
    (?!.*\.\.)      : Fail if it contains ".." (two or more sequential dots) anywhere
    .+              : Match 1+ allowed characters
    $               : End of string

    Args:
        path (str): The file path to validate.

    Returns:
        bool: True if the path is valid, False otherwise.
    """
    regex = r"^(?!.*[\\:\0])(?!.*\.\.).+$"
    return bool(re.match(regex, path))


def get_repo_name(git_url: str) -> str:
    """
    Extracts 'repository_abc' from 'git@github.com:user/repository_abc.git'
    """
    if not validate_repository_string(git_url):
        raise click.ClickException(f"Invalid git URL: {git_url}")

    # Split by '/' to get the last part (e.g., repo.git)
    # Then remove the last 4 characters (.git)
    return git_url.split("/")[-1][:-4]


def get_clone_arguments(repositories: dict, root: str) -> dict:
    """
    Returns a dictionary mapping git URLs to their target local paths.
    Format: { "git@...": "root/path/repo_name" }
    """
    results = {}
    for directory, git_urls in repositories.items():
        for url in git_urls:
            repo_name = get_repo_name(url)
            full_path_to_directory = os.path.join(root, directory, repo_name)
            results[url] = full_path_to_directory

    return results
