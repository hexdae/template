load("//toolchain/ipython:jupyter.bzl", "jupyter_notebook")
load("@pip_deps//:requirements.bzl", "requirement")

jupyter_notebook(
    name = "notebook",
    notebook = "notebook.ipynb",
    deps = [
        "//examples/python:library",
        requirement("numpy"),
    ],
)
