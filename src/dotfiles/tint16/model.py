from __future__ import annotations

from dataclasses import dataclass
from typing import Any


@dataclass(frozen=True, slots=True)
class Palette:
    name: str
    author: str
    colors: list[str]
    foreground: str
    background: str

    def to_dict(self) -> dict[str, Any]:
        return {
            "name": self.name,
            "author": self.author,
            "background": self.background,
            "foreground": self.foreground,
            **{f"color{i}": color for i, color in enumerate(self.colors)},
            **{
                f"color{i}_value": (color[1:] if color.startswith("#") else color)
                for i, color in enumerate(self.colors)
            },
            "background_value": (
                self.background[1:]
                if self.background.startswith("#")
                else self.background
            ),
            "foreground_value": (
                self.foreground[1:]
                if self.foreground.startswith("#")
                else self.foreground
            ),
        }

    @staticmethod
    def from_json(data: dict[str, Any]) -> "Palette":
        return Palette(
            name=data["name"],
            author=data["author"],
            colors=data["color"],
            foreground=data["foreground"],
            background=data["background"],
        )
