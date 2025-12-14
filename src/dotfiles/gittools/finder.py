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
    """Check if a path matches any ignored pattern."""
    ignore_set = set(ignore_patterns)
    return path.name in ignore_set
