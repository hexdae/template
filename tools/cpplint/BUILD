load("@poetry//:requirements.bzl", "requirement")
load("@rules_python//python:defs.bzl", "py_binary")

py_binary(
    name = "cpplint",
    srcs = ["cpplint.py"],
    visibility = ["//visibility:public"],
    deps = [
        requirement("cpplint"),
    ],
)
