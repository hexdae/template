load("@aspect_rules_py//py:defs.bzl", "py_binary")

py_binary(
    name = "pre-commit",
    srcs = ["pre-commit.py"],
    visibility = ["//visibility:public"],
    deps = [
        "@pip//:pre-commit",
    ],
)
