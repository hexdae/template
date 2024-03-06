load("@rules_python//python:defs.bzl", "py_binary")

py_binary(
    name = "poetry",
    srcs = ["poetry.py"],
    args = ["$(location @poetry_prebuilt//:poetry)"],
    data = ["@poetry_prebuilt//:poetry"],
    visibility = ["//visibility:public"],
)

py_binary(
    name = "download",
    srcs = ["download.py"],
    visibility = ["//visibility:public"],
    deps = ["@pip//:requests"],
)
