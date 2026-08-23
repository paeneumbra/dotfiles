import click

from dotfiles.gitctl.commands import bulk_clone, bulk_update
from dotfiles.version import get_version


@click.group(context_settings={"help_option_names": ["-h", "--help"]})
@click.version_option(version=get_version(), prog_name="dotfiles.gitctl")
def cli() -> None:
    """Git repository management tools."""


cli.add_command(bulk_update.update)  # type: ignore
cli.add_command(bulk_clone.clone)  # type: ignore

if __name__ == "__main__":
    print(f"DEBUG: Registered commands: {cli.commands.keys()}")
    cli()
