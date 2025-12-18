from pathlib import Path

import click
import yaml
from yaml import YAMLError


def read_yaml(filepath: Path) -> dict:
    """Returns a YAML object from a given file"""
    with open(filepath) as read_file:
        try:
            return yaml.safe_load(read_file)
        except YAMLError as err:
            raise click.ClickException(f"YAML parsing error in {filepath}: {err}")
        except OSError as err:
            raise click.ClickException(f"Error reading {filepath}: {err}")
