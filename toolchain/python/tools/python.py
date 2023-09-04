"""Simple module to start an Python REPL from within Bazel."""

import subprocess
import argparse
import sys
import os
import pathlib


def parse():
    parser = argparse.ArgumentParser()
    return parser.parse_known_args()


if __name__ == "__main__":
    args, options = parse()

    filepath = pathlib.Path(os.path.realpath(__file__))
    package = filepath.parent
    workspace = package.parent.parent

    os.chdir(workspace)
    result = subprocess.run([sys.executable] + options)
    exit(result.returncode)
