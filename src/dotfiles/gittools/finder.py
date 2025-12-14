from pathlib import Path


def find_git_repositories(root: Path, ignore_patterns: list[str]) -> list[Path]:
    repos = []
    for path in root.rglob(".git"):
        if path.is_dir():
            repo_path = path.parent
            if not should_ignore_path(repo_path, ignore_patterns):
                repos.append(repo_path)
    return sorted(repos)


def should_ignore_path(path: Path, ignore_patterns: list[str]) -> bool:
    """Check if a path or any of its parent directories match any ignored pattern."""
    ignore_set = set(ignore_patterns)
    # Check the path itself and all its parts
    for part in path.parts:
        if part in ignore_set:
            return True
    return False
