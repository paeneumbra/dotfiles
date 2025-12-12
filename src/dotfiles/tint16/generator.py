from __future__ import annotations

from pathlib import Path
from typing import Final

from .model import Palette

_TEMPLATE_GLOB: Final[str] = "*"


def render_templates(*, templates_dir: Path, palette: Palette) -> dict[str, str]:
    """
    Read all template files from templates_dir and render them using Palette.to_dict().
    Returns: {filename: rendered_text}
    """
    templates_dir = templates_dir.expanduser().resolve()
    if not templates_dir.exists():
        raise FileNotFoundError(f"Templates directory not found: {templates_dir}")
    if not templates_dir.is_dir():
        raise NotADirectoryError(f"Templates path is not a directory: {templates_dir}")

    color_values = palette.to_dict()
    rendered: dict[str, str] = {}

    for template_path in sorted(
        p for p in templates_dir.glob(_TEMPLATE_GLOB) if p.is_file()
    ):
        template_text = template_path.read_text(encoding="utf-8")
        # NOTE: str.format() converts any `{{` to `{` (handy for rofi templates)
        rendered[template_path.name] = template_text.format(**color_values)

    return rendered


def write_palettes(*, output_dir: Path, rendered: dict[str, str]) -> list[Path]:
    """
    Write rendered templates into output_dir (created if needed).
    Returns a list of written file paths.
    """
    output_dir = output_dir.expanduser().resolve()
    output_dir.mkdir(parents=True, exist_ok=True)

    written: list[Path] = []
    for filename, content in rendered.items():
        out_path = output_dir / filename
        out_path.write_text(content, encoding="utf-8")
        written.append(out_path)

    return written
