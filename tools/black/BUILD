load("@pip//:requirements.bzl", "requirement")
load("@rules_python//python:defs.bzl", "py_binary")

py_binary(
    name = "black",
    srcs = ["black.py"],
    visibility = ["//visibility:public"],
    deps = [
        requirement("black"),
        requirement("jupyter-black"),
    ],
)
