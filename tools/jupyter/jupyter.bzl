"""Rules to launch IPython shells and Jupyter notebooks"""

load("@pip//:requirements.bzl", "all_requirements")
load("@rules_python//python:defs.bzl", "py_binary")

def jupyter_notebook(name, notebook, deps = [], data = [], **kwargs):
    """ Creates a Macro to launch a Jupyter notebook.

    Args:
        name: Name of the macro.
        notebook: Path to the notebook to launch.
        deps (optional): List of dependencies to pass to the macro.
        data (optional): List of data dependencies to pass to the macro.
       **kwargs: Additional arguments to pass to the macro.
    """

    py_binary(
        name = name,
        main = "//tools/jupyter:jupyter.py",
        srcs = ["//tools/jupyter:jupyter.py"],
        args = ["$(location {})".format(notebook)],
        deps = deps + all_requirements,
        data = data + [notebook],
        **kwargs
    )

jupyter = struct(
    notebook = jupyter_notebook,
)
