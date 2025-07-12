#!/usr/bin/env python3


import os
import hashlib
import sys


__version__ = "0.2.1"


def calculate_sha256(file_path):
    """Calculate the SHA-256 hash of a file."""
    sha256 = hashlib.sha256()
    try:
        with open(file_path, "rb") as f:
            for chunk in iter(lambda: f.read(4096), b""):
                sha256.update(chunk)
    except IOError:
        print(f"Error reading file: {file_path}")
        return None
    return sha256.hexdigest()


def should_exclude_path(path, exclude_patterns):
    """Check if a path should be excluded based on exclude patterns."""
    if not exclude_patterns:
        return False

    normalized_path = path.replace(os.sep, "/")

    for pattern in exclude_patterns:
        normalized_pattern = pattern.replace(os.sep, "/")
        if normalized_pattern in normalized_path:
            return True

    return False


def get_all_files(directory, exclude_patterns=None):
    """Recursively get all files in a directory, excluding paths that match any exclude pattern."""
    all_files = {}
    for root, dirs, files in os.walk(directory):
        relative_root = os.path.relpath(root, directory)

        if should_exclude_path(relative_root, exclude_patterns):
            dirs[:] = []
            continue

        for file in files:
            file_path = os.path.join(root, file)
            relative_path = os.path.relpath(file_path, directory)

            if should_exclude_path(relative_path, exclude_patterns):
                continue

            all_files[relative_path] = file_path
    return all_files


def compare_directories(dir1, dir2, exclude_patterns=None):
    """Compare two directories and return files that differ."""
    files_dir1 = get_all_files(dir1, exclude_patterns)
    files_dir2 = get_all_files(dir2, exclude_patterns)

    differing_files = []
    only_in_dir1 = []
    only_in_dir2 = []

    # Check for files that are in both directories
    common_files = set(files_dir1.keys()).intersection(set(files_dir2.keys()))
    for file in common_files:
        hash1 = calculate_sha256(files_dir1[file])
        hash2 = calculate_sha256(files_dir2[file])
        print(file)
        if hash1 != hash2:
            differing_files.append(file)

    # Check for files that are only in one directory
    only_in_dir1 = set(files_dir1.keys()) - set(files_dir2.keys())
    only_in_dir2 = set(files_dir2.keys()) - set(files_dir1.keys())

    return differing_files, list(only_in_dir1), list(only_in_dir2)


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print(
            f"Program: compare.py version {__version__}",
            "\nUsage: python compare_directories.py <directory1> <directory2> [--exclude directory/subdirectory another-directory ...]",
        )
        sys.exit(1)

    dir1 = sys.argv[1]
    dir2 = sys.argv[2]

    # Default exclusion patterns
    exclude_patterns = [".Trash-1001"]

    # Parse exclude patterns
    if len(sys.argv) > 3 and sys.argv[3] == "--exclude":
        exclude_patterns.extend(sys.argv[4:])

    if exclude_patterns:
        print(f"> Excluding paths containing: {', '.join(exclude_patterns)}")

    differing_files, only_in_dir1, only_in_dir2 = compare_directories(
        dir1, dir2, exclude_patterns
    )

    if differing_files:
        print("> Files that exist in both directories but are different:")
        for file in differing_files:
            print(file)
    if only_in_dir1:
        print("\n> Files that only exist in the first directory:")
        for file in only_in_dir1:
            print(file)
    if only_in_dir2:
        print("\n> Files that only exist in the second directory:")
        for file in only_in_dir2:
            print(file)
    differences_found = [len(differing_files), len(only_in_dir1), len(only_in_dir2)]
    print(f"\nRequest complete, {differences_found} differences found")
