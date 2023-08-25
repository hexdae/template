load("//toolchain/ipython:jupyter.bzl", "jupyter_notebook")
load("@rules_python//python:defs.bzl", "py_library")
load("@pip_deps//:requirements.bzl", "requirement")

py_library(
    name = "dependency",
    srcs = ["dependency.py"],
)

jupyter_notebook(
    name = "notebook",
    notebook = "notebook.ipynb",
    deps = [
        "//examples/python:library",
        requirement("numpy"),
    ],
)
