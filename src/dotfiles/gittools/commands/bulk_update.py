from pathlib import Path

import click

from dotfiles.gittools.finder import find_git_repositories
from dotfiles.gittools.operations import update_repository
from dotfiles.tui.click_logs import click_debug, click_error, click_success, click_info


def _print_found_repositories(paths: list[Path]) -> None:
    if not paths:
        click_error("No git repositories found")
        return
    click_success("Repositories:")
    for path in paths:
        click_info(str(path))


@click.command(name="update", help="Update all git repositories on path")
@click.option(
    "--root",
    "-r",
    type=click.Path(exists=True, file_okay=False, path_type=Path),
    required=False,
    help="Root directory to search for git repositories. Defaults to depository root",
)
@click.option(
    "--depository",
    "-d",
    is_flag=True,
    help="Search for git repositories in depository root",
)
@click.option(
    "--ignore",
    "-i",
    type=str,
    help="Directory names to ignore (comma-separated).",
)
@click.option(
    "--list",
    "-l",
    "list_repositories",
    default=False,
    is_flag=True,
    help="List git repositories found on path",
)
def update(
    root: Path, depository: bool, ignore: str, list_repositories: bool
) -> None:
    click_debug(
        f"root: {root}, depository: {depository}, ignore: {ignore}, list: {list_repositories}"
    )

    if not root and not depository:
        return click_error("Either root or depository must be specified")

    if depository:
        root = Path.home() / "depository"

    ignore_list = ignore.split(",") if ignore else []
    git_repos = find_git_repositories(root, ignore_list)

    if list_repositories:
        _print_found_repositories(git_repos)
        return None

    else:
        for repo in git_repos:
            result = update_repository(repo)
            if result.success:
                click_success(result.get_messages())
            else:
                click_error(result.get_errors())
        return None
