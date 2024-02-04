import subprocess
import argparse
import os
import pathlib


def parse():
    parser = argparse.ArgumentParser(add_help=False)
    return parser.parse_known_args()


if __name__ == "__main__":
    args, options = parse()

    executable = os.path.realpath(os.environ["RUSTFMT"])
    filepath = pathlib.Path(os.path.realpath(__file__))
    package = filepath.parent
    workspace = package.parent.parent

    os.chdir(workspace)
    result = subprocess.run([executable] + options)
    exit(result.returncode)
