import subprocess
from datetime import datetime
from pathlib import Path

from dotfiles.gittools.files import get_clone_arguments
from dotfiles.gittools.models import OperationOutput, OperationResult

timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

git_pull = ["git", "pull"]
git_log = ["git", "log"]
git_status = ["git", "status", "--porcelain"]
git_stash = [
    "git",
    "stash",
    "push",
    "--include-untracked",
    "--message",
    f"GIT UPDATE SCRIPT AUTO STASH {timestamp}",
]
git_default_branch = ["git", "symbolic-ref", "refs/remotes/origin/HEAD"]
git_current_branch = ["git", "branch", "--show-current"]
git_checkout = ["git", "switch"]
git_fetch = ["git", "fetch", "--all"]
git_clone = ["git", "clone"]


def execute_git_command(command: list[str], cwd: Path | None) -> OperationOutput:
    # If cwd is not specified, use the current working directory -> Necessary for git clone
    try:
        operation_result = subprocess.run(
            command,
            cwd=cwd,
            capture_output=True,
            text=True,
            check=False,
            timeout=30,
        )

        return OperationOutput(
            command=command,
            return_code=operation_result.returncode,
            stdout=operation_result.stdout.strip(),
            stderr=operation_result.stderr.strip(),
        )
    except subprocess.TimeoutExpired:
        return OperationOutput(
            command=command,
            return_code=-1,
            stdout="",
            stderr="Command timed out",
        )
    except FileNotFoundError:
        return OperationOutput(command, -1, "", "Git not found in PATH")
    except Exception as e:
        return OperationOutput(command, -1, "", f"Unexpected error: {e}")


def update_repository(repo_path: Path) -> OperationResult:
    # Fails fast if any operation that returns a failure
    result = OperationResult(repo_path)

    fetch = execute_git_command(git_fetch, repo_path)
    result.append(fetch)
    if fetch.failure:
        return result

    default = execute_git_command(git_default_branch, repo_path)
    default_trimmed = default.stdout.removeprefix("refs/remotes/origin/")
    result.append(default)
    if default.failure:
        return result

    current = execute_git_command(git_current_branch, repo_path)
    current_branch = current.stdout.strip()
    result.append(current)
    if current.failure:
        return result

    status = execute_git_command(git_status, repo_path)
    result.append(status)
    if status.failure:
        return result

    if status.stdout.strip() != "":
        stash = execute_git_command(git_stash, repo_path)
        if stash.failure:
            result.append(stash)
            return result
        else:
            result.append(stash, f"Stashed files on branch {current_branch}")

    if current_branch != default_trimmed:
        switch = execute_git_command([*git_checkout, default_trimmed], repo_path)
        if switch.failure:
            result.append(switch)
            return result
        else:
            result.append(
                switch, f"Switch from {current_branch} to branch {default_trimmed}"
            )

    pull = execute_git_command(git_pull, repo_path)
    if pull.failure:
        result.append(pull, "Pull failed")
    else:
        result.append(pull, "Pull successful")
    return result


def clone_from_file(repositories: dict, root: str) -> OperationResult:
    result = OperationResult(Path(root))
    url_to_target_dir = get_clone_arguments(repositories, root)

    for url, target_dir in url_to_target_dir.items():
        # Explicitly set cwd to none for git clone, otherwise it will fail
        clone = execute_git_command([*git_clone, url, target_dir], None)
        if clone.failure:
            result.append(clone, f"Failed to clone {url}")
        else:
            result.append(clone, f"Cloned {url} to {target_dir}")
    return result
