import pytest
import yaml

from dotfiles.gitctl.files import (
    map_directory_to_repositories,
    validate_repository_string,
    is_valid_path,
    get_clone_arguments,
)


@pytest.fixture
def sample_yaml():
    yaml_content = """
directory_a:
  directory_ab:
    directory_abc: git@github.com:user/repository_abc.git
directory_b:
  - git@github.com:user/repository_b.git
  - directory_ba:
      directory_bb:
        directory_bc:
          - git@github.com:user/repository_ba.git
          - git@github.com:user/repository_bb.git
directory_c:
  - git@github.com:user/repository_c.git
  - git@github.com:user/repository_d.git
  - directory_e:
    - git@github.com:user/repository_e.git
    - git@github.com:user/repository_f.git
  - directory_f:
    - git@github.com:user/repository_g.git
    - directory_g:
      - git@github.com:user/repository_h.git
directory_i:
  - git@github.com:user/repository_i.git
directory_j/directory_k:
  - git@github.com:user/repository_j.git
"""
    return yaml.safe_load(yaml_content)


@pytest.fixture
def repositories_data():
    return {
        "directory_a/directory_ab/directory_abc": [
            "git@github.com:user/repository_abc.git"
        ],
        "directory_b": ["git@github.com:user/repository_b.git"],
        "directory_b/directory_ba/directory_bb/directory_bc": [
            "git@github.com:user/repository_ba.git",
            "git@github.com:user/repository_bb.git",
        ],
        "directory_c": [
            "git@github.com:user/repository_c.git",
            "git@github.com:user/repository_d.git",
        ],
        "directory_c/directory_e": [
            "git@github.com:user/repository_e.git",
            "git@github.com:user/repository_f.git",
        ],
        "directory_c/directory_f": ["git@github.com:user/repository_g.git"],
        "directory_c/directory_f/directory_g": ["git@github.com:user/repository_h.git"],
        "directory_i": ["git@github.com:user/repository_i.git"],
        "directory_j/directory_k": ["git@github.com:user/repository_j.git"],
    }


def test_parse_repositories(sample_yaml, repositories_data):
    result = map_directory_to_repositories(sample_yaml)
    assert result == repositories_data


def test_validate_repository_string():
    assert validate_repository_string("git@github.com:user/repository_a.git") is True
    assert validate_repository_string("git@github.comuser/repository_a.git") is False
    assert validate_repository_string("invalid") is False


@pytest.mark.parametrize(
    "path",
    [
        "simple_directory",
        "group/subgroup",
        ".config",  # Starts with one dot (valid)
        "archive.tar.gz",  # Dots separated by chars (valid)
        "v1.0.1",  # Dots separated by chars (valid)
    ],
)
def test_valid_paths(path):
    assert is_valid_path(path) is True


@pytest.mark.parametrize(
    "path",
    [
        r"group\subgroup",  # Backslash
        "name:tag",  # Colon
        "..",  # Sequential dots
        "...",  # Sequential dots
        "folder..name",  # Sequential dots
        "../parent",  # Traversal (contains ..)
        "parent/..",  # Traversal (contains ..)
        "",  # Empty
    ],
)
def test_invalid_paths(path):
    assert is_valid_path(path) is False


def test_clone_arguments(repositories_data):
    expected_result = {
        "git@github.com:user/repository_abc.git": "home/directory_a/directory_ab/directory_abc/repository_abc",
        "git@github.com:user/repository_b.git": "home/directory_b/repository_b",
        "git@github.com:user/repository_ba.git": "home/directory_b/directory_ba/directory_bb/directory_bc/repository_ba",
        "git@github.com:user/repository_bb.git": "home/directory_b/directory_ba/directory_bb/directory_bc/repository_bb",
        "git@github.com:user/repository_c.git": "home/directory_c/repository_c",
        "git@github.com:user/repository_d.git": "home/directory_c/repository_d",
        "git@github.com:user/repository_e.git": "home/directory_c/directory_e/repository_e",
        "git@github.com:user/repository_f.git": "home/directory_c/directory_e/repository_f",
        "git@github.com:user/repository_g.git": "home/directory_c/directory_f/repository_g",
        "git@github.com:user/repository_h.git": "home/directory_c/directory_f/directory_g/repository_h",
        "git@github.com:user/repository_i.git": "home/directory_i/repository_i",
        "git@github.com:user/repository_j.git": "home/directory_j/directory_k/repository_j",
    }

    root_dir = "home"
    result = get_clone_arguments(repositories_data, root_dir)

    assert result == expected_result
