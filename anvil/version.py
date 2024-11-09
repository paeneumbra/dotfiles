import importlib.metadata


def get_version() -> str:
    try:
        return importlib.metadata.version("anvil")
    except importlib.metadata.PackageNotFoundError:
        return "0.0.0"


__version__ = f"v{get_version()}"
