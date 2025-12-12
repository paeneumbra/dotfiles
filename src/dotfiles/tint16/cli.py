from __future__ import annotations

import json
from pathlib import Path

import click

from ..version import get_version
from .generator import render_templates, write_palettes
from .model import Palette

DOTFILES_DIR = Path.home() / "depository" / "dotfiles"

TINT16_DIR = DOTFILES_DIR / "terminal" / ".config" / "tint16"
TEMPLATES_DIR = TINT16_DIR / "templates"
OUTPUT_DIR = TINT16_DIR / "palettes"
SCHEMAS_DIR = TINT16_DIR / "schemas"


def _ensure_static_dirs() -> None:
    if not TINT16_DIR.is_dir():
        raise click.ClickException(f"Tint16 directory not found: {TINT16_DIR}")
    if not TEMPLATES_DIR.is_dir():
        raise click.ClickException(f"Templates directory not found: {TEMPLATES_DIR}")
    if not SCHEMAS_DIR.is_dir():
        raise click.ClickException(f"Schemas directory not found: {SCHEMAS_DIR}")
    # OUTPUT_DIR is created by write_palettes()


def _print_available_schema_paths() -> None:
    schema_files = sorted(
        p.resolve() for p in SCHEMAS_DIR.glob("*.json") if p.is_file()
    )
    if not schema_files:
        click.echo("(no schemas found)")
        return
    for path in schema_files:
        click.echo(str(path))


@click.command(context_settings={"help_option_names": ["-h", "--help"]})
@click.version_option(version=get_version(), prog_name="tint16")
@click.option(
    "--list-schemas",
    is_flag=True,
    help="List available schema JSON files under terminal/.config/tint16/schemas and exit.",
)
@click.argument(
    "json_file",
    required=False,
    type=click.Path(exists=True, dir_okay=False, path_type=Path),
)
def cli(list_schemas: bool, json_file: Path | None) -> None:
    """Generate terminal palette files from a tint16 JSON file path."""
    _ensure_static_dirs()

    if list_schemas:
        _print_available_schema_paths()
        return

    if json_file is None:
        raise click.UsageError(
            "Missing argument 'JSON_FILE'. Provide a path, or use --list-schemas."
        )

    json_input = json_file.expanduser().resolve().read_text(encoding="utf-8")
    palette = Palette.from_json(json.loads(json_input))

    rendered = render_templates(templates_dir=TEMPLATES_DIR, palette=palette)
    write_palettes(output_dir=OUTPUT_DIR, rendered=rendered)

    click.echo(f"Generated {len(rendered)} file(s) for {palette.name} -> {OUTPUT_DIR}")


if __name__ == "__main__":
    cli()
