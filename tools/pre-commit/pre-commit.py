import subprocess
import argparse
import sys
import os
import pathlib
import stat


def parse():
    parser = argparse.ArgumentParser()
    parser.add_argument("command")
    return parser.parse_known_args()


if __name__ == "__main__":
    args, options = parse()

    filepath = pathlib.Path(os.path.realpath(__file__))
    package = filepath.parent
    workspace = package.parent.parent

    if args.command == "install":
        pre_commit_hook = workspace / ".git/hooks/pre-commit"

        # Add the pre commit
        with open(pre_commit_hook, "w") as hook:
            tool = os.path.relpath(package, workspace)
            hook.write(f"bazel run --config=quiet {tool} run")

        # Make the hook executable
        st = os.stat(pre_commit_hook)
        os.chmod(pre_commit_hook, st.st_mode | stat.S_IEXEC)

    else:
        if args.command in ["run", "autoupdate"]:
            options += ["--config", f"tools/pre-commit/config.yaml"]

        os.chdir(workspace)
        result = subprocess.run(
            [sys.executable, "-m", "pre_commit", args.command] + options
        )
        exit(result.returncode)
