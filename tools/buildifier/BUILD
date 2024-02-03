load("@rules_python//python:defs.bzl", "py_binary")

py_binary(
    name = "buildifier",
    srcs = ["buildifier.py"],
    args = ["$(location @buildifier_prebuilt//:buildifier)"],
    data = ["@buildifier_prebuilt//:buildifier"],
    visibility = ["//visibility:public"],
)
