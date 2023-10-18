load("@rules_python//python:defs.bzl", "py_library", "py_binary")

py_library(
    name = "library",
    srcs = ["library.py"],
    visibility = ["//visibility:public"],
)

py_binary(
    name = "binary",
    main = "main.py",
    srcs = ["main.py"],
    visibility = ["//visibility:public"],
)