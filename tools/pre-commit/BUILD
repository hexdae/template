load("@rules_python//python:defs.bzl", "py_binary")

py_binary(
    name = "pre-commit",
    srcs = ["pre-commit.py"],
    visibility = ["//visibility:public"],
    deps = [
        "@poetry//:pre-commit",
    ],
)
