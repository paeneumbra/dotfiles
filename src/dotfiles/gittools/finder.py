from pathlib import Path

from dotfiles.commons.path_operations import should_ignore_path


def find_git_repositories(root: Path, ignore_patterns: list[str]) -> list[Path]:
    repos = []
    for path in root.rglob(".git"):
        if path.is_dir():
            repo_path = path.parent
            if not should_ignore_path(repo_path, ignore_patterns):
                repos.append(repo_path)
    return sorted(repos)
