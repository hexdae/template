# load("@pip//:requirements.bzl", "requirement")
load("@aspect_rules_py//py:defs.bzl", "py_binary")

py_binary(
    name = "black",
    srcs = ["black.py"],
    visibility = ["//visibility:public"],
    deps = [
        "@pip//:black",
        "@pip//:jupyter-black",
    ],
)
