from pathlib import Path

import click

from dotfiles.gittools.files import read_yaml, map_directory_to_repositories
from dotfiles.gittools.operations import clone_from_file
from dotfiles.tui.click_logs import click_debug, click_error, click_success, click_info


def _print_found_repositories(repos: dict[str, str]) -> None:
    if not repos:
        click_error("No git repositories found")
        return
    click_success("Directories -> Repositories:")
    for directory, urls in repos.items():
        urls_list = urls if isinstance(urls, list) else [urls]
        for url in urls_list:
            click_info(f"{directory} -> {url}")


class RawHelp(click.Command):
    def format_epilog(self, ctx, formatter):
        if self.epilog:
            formatter.write_paragraph()
            for line in self.epilog.split("\n"):
                formatter.write_text(line)


YAML_HELP = """
\b
YAML Format Structure Supported:
----------------------
# 1. Direct Mapping (Directory -> Repo)
folder_a: git@github.com:user/repo_a.git

# 2. List of Repos (Directory -> [Repos])
folder_b:
  - git@github.com:user/repo_b1.git
  - git@github.com:user/repo_b2.git

# 3. Nested Structure (Directory -> Subdirectory -> Repo)
folder_c:
  subfolder_d:
    - git@github.com:user/repo_d.git

# 4. Mixed (Repos and Subdirectories)
folder_e:
  - git@github.com:user/repo_e1.git
  - subfolder_f:
      - git@github.com:user/repo_f.git
"""


@click.command(
    name="clone",
    help="Clone all git repositories on file",
    cls=RawHelp,
    epilog=YAML_HELP,
)
@click.option(
    "--yaml-file",
    "-f",
    required=True,
    type=click.Path(exists=True, dir_okay=False, path_type=Path),
    help="Path to the YAML file containing repository definitions.",
)
@click.option(
    "--root",
    "-r",
    default=Path.home(),
    show_default=True,
    type=click.Path(exists=True, file_okay=False, path_type=Path),
    help="Target root directory for the repositories (defaults to HOME).",
)
@click.option(
    "--list",
    "-l",
    "list_repositories",
    default=False,
    is_flag=True,
    help="List git repositories found on path",
)
def clone(yaml_file: Path, root: Path, list_repositories: bool):
    click_debug(f"yaml: {yaml_file}, root: {root}, list: {list_repositories}")

    try:
        yaml_content = read_yaml(yaml_file)
        repos = map_directory_to_repositories(yaml_content)

        if list_repositories:
            _print_found_repositories(repos)
        else:
            result = clone_from_file(repos, str(root))
            if result.success:
                click_success(result.get_messages())
            else:
                click_error(result.get_errors())
    except Exception as e:
        click_error(f"Error cloning repositories: {e}")


if __name__ == "__main__":
    clone()
