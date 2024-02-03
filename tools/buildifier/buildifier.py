import subprocess
import argparse
import sys
import os
import pathlib


def parse():
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument("buildifier", type=pathlib.Path)
    return parser.parse_known_args()


if __name__ == "__main__":
    args, options = parse()

    buildifier = os.path.realpath(args.buildifier)
    filepath = pathlib.Path(os.path.realpath(__file__))
    package = filepath.parent
    workspace = package.parent.parent

    os.chdir(workspace)
    result = subprocess.run(["buildifier"] + options)
    exit(result.returncode)
