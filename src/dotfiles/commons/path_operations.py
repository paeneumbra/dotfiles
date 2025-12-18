from pathlib import Path


def should_ignore_path(path: Path, ignore_patterns: list[str]) -> bool:
    """Check if a path or any of its parents match any ignored pattern."""
    ignore_set = set(ignore_patterns)
    # Check the path itself and all its parts
    for part in path.parts:
        if part in ignore_set:
            return True
    return False


def get_files_in_dir(directory: Path, ignore_list: list[str]) -> set[Path]:
    """Recursively get all files in a directory, excluding ignored paths."""
    files = set()
    for item in directory.rglob("*"):
        if item.is_file() and not should_ignore_path(
            item.relative_to(directory), ignore_list
        ):
            files.add(item.relative_to(directory))
    return files
