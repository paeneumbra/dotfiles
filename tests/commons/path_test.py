from pathlib import Path

import pytest

from dotfiles.commons.path_operations import get_files_in_dir, should_ignore_path


@pytest.mark.parametrize(
    "path,ignore_list",
    [
        (Path("src/__pycache__/file.pyc"), ["__pycache__"]),
        (Path("node_modules/package/index.js"), ["node_modules"]),
        (Path("src/.vscode/settings.json"), [".vscode"]),
        (Path("src/cache/file.py"), ["file.py"]),
    ],
)
def test_should_ignore_returns_true(path, ignore_list):
    """Test paths that should be ignored."""
    assert should_ignore_path(path, ignore_list) is True


@pytest.mark.parametrize(
    "path,ignore_list",
    [
        (Path("tests/test_main.py"), ["node_modules", "dist"]),
        (Path("src/test_cache/file.py"), ["cache"]),
        (Path("SRC/pycache/file.py"), ["__pycache__"]),
        (Path("SRC/PYCACHE/file.py"), ["pycache"]),  # case-sensitive
        (Path("main.py"), ["__pycache__"]),
        (Path("src/main.py"), []),
    ],
)
def test_should_ignore_returns_false(path, ignore_list):
    """Test paths that should not be ignored."""
    assert should_ignore_path(path, ignore_list) is False


@pytest.fixture
def setup_directory(tmp_path):
    """Create a directory structure for testing."""

    def _setup(structure):
        for file_path in structure:
            full_path = tmp_path / file_path
            full_path.parent.mkdir(parents=True, exist_ok=True)
            full_path.write_text("content")
        return tmp_path

    return _setup


@pytest.mark.parametrize(
    "structure,ignore_list,expected",
    [
        # No ignores - get all files
        (
            ["main.py", "test.py", "src/app.py"],
            [],
            {"main.py", "test.py", "src/app.py"},
        ),
        # Ignore __pycache__
        (
            ["main.py", "src/app.py", "src/__pycache__/app.cpython-39.pyc"],
            ["__pycache__"],
            {"main.py", "src/app.py"},
        ),
        # Ignore multiple patterns
        (
            ["main.py", ".git/config", "node_modules/pkg/index.js", "src/app.py"],
            [".git", "node_modules"],
            {"main.py", "src/app.py"},
        ),
        # Nested ignores
        (
            [
                "src/main.py",
                "src/__pycache__/main.pyc",
                "tests/test.py",
                "tests/__pycache__/test.pyc",
            ],
            ["__pycache__"],
            {"src/main.py", "tests/test.py"},
        ),
    ],
)
def test_get_all_files_with_ignores(setup_directory, structure, ignore_list, expected):
    """Test getting files with various ignore patterns."""
    directory = setup_directory(structure)
    result = get_files_in_dir(directory, ignore_list)
    expected_paths = {Path(p) for p in expected}
    assert result == expected_paths
