import click


def click_error(message: str) -> None:
    """Display an error message in red with bold 'Error:' prefix."""
    click.echo(click.style("Error: ", fg="red", bold=True) + message)


def click_warning(message: str) -> None:
    """Display a warning message in yellow."""
    click.echo(click.style("Warning: ", fg="yellow", bold=True) + message)


def click_success(message: str) -> None:
    """Display a success message in green."""
    click.echo(click.style("Success: ", fg="green", bold=True) + message)


def click_info(message: str) -> None:
    """Display an indented info message in blue."""
    click.secho(f"\t{message}", fg="blue")


def click_debug(message: str) -> None:
    """Display a debug message."""
    click.secho(click.style(message, fg="black", bg="white"))
