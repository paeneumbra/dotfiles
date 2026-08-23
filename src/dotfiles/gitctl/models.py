from __future__ import annotations

from dataclasses import dataclass, field
from pathlib import Path
from textwrap import indent


@dataclass(frozen=True, slots=True)
class OperationOutput:
    command: list[str]
    return_code: int
    stdout: str
    stderr: str

    @property
    def failure(self) -> bool:
        return self.return_code != 0

    def __str__(self) -> str:
        lines = [
            f"command: {' '.join(self.command)}",
            f"return_code: {self.return_code}",
        ]
        if self.stdout:
            lines.append(f"stdout:\n{indent(self.stdout, '  ')}")
        if self.stderr:
            lines.append(f"stderr:\n{indent(self.stderr, '  ')}")
        lines.append("-" * 60)
        return "\n".join(lines)


@dataclass(slots=True)
class OperationResult:
    repository: Path
    operation_results: list[OperationOutput] = field(default_factory=list)
    messages: list[str] = field(default_factory=list)

    def append(
        self, result: OperationOutput, result_message: str | None = None
    ) -> OperationResult:
        self.operation_results.append(result)
        if result_message:
            self.messages.append(result_message)
        return self

    @property
    def success(self) -> bool:
        return all(op.return_code == 0 for op in self.operation_results)

    def __str__(self) -> str:
        lines = [f"repository: {self.repository}", "-" * 60]
        lines.extend(str(op) for op in self.operation_results)
        lines.extend(self.messages)
        return "\n".join(lines)

    def get_messages(self) -> str:
        lines = [f"repository: {self.repository}", "-" * 60]
        for msg in self.messages:
            lines.extend(msg.split("\n"))
        lines.append("-" * 60)
        if self.operation_results:
            last_output = self.operation_results[-1]
            stdout_lines = last_output.stdout.strip().split("\n")
            if stdout_lines:
                lines.extend(stdout_lines)
        lines.append("-" * 60)
        return "\n".join(lines)

    def get_errors(self) -> str:
        lines = [f"repository: {self.repository}", "-" * 60]
        for op in self.operation_results:
            if op.failure:
                lines.extend(op.stderr.split("\n"))
        lines.append("-" * 60)
        return "\n".join(lines)
