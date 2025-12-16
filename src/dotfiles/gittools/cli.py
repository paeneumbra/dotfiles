import click

from dotfiles.gittools.commands import bulk_update, bulk_clone
from dotfiles.version import get_version


@click.group(context_settings={"help_option_names": ["-h", "--help"]})
@click.version_option(version=get_version(), prog_name="dotfiles.gittools")
def cli() -> None:
    """Git repository management tools."""
    pass


cli.add_command(bulk_update.update)  # type: ignore
cli.add_command(bulk_clone.clone)  # type: ignore

if __name__ == "__main__":
    print(f"DEBUG: Registered commands: {cli.commands.keys()}")
    cli()
