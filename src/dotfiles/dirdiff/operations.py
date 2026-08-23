import filecmp
import hashlib
from pathlib import Path

from dotfiles.tui.click_logs import click_error


def compare_file_content(file1: Path, file2: Path) -> bool:
    """Compare the content of two files."""
    return filecmp.cmp(file1, file2, shallow=False)


def calculate_sha256(file_path: Path) -> str | None:
    """Calculate the SHA-256 hash of a file."""
    sha256 = hashlib.sha256()
    try:
        with open(file_path, "rb") as f:
            while True:
                data = f.read(65536)  # 64KB
                if not data:
                    break
                sha256.update(data)
    except (OSError, PermissionError, FileNotFoundError) as err:
        click_error(f"Error reading file: {file_path}, {err}")
        return None
    return sha256.hexdigest()
