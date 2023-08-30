load("@pip//:requirements.bzl", "requirement")
load("//toolchain/python:jupyter.bzl", "jupyter_notebook")

jupyter_notebook(
    name = "notebook",
    notebook = "notebook.ipynb",
    deps = [
        "//examples/python:library",
        requirement("numpy"),
    ],
)
