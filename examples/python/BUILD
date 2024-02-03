load("@rules_python//python:defs.bzl", "py_binary", "py_library", "py_test")

py_library(
    name = "library",
    srcs = ["library.py"],
    visibility = ["//visibility:public"],
)

py_binary(
    name = "binary",
    srcs = ["main.py"],
    main = "main.py",
    visibility = ["//visibility:public"],
    deps = [":library"],
)

py_test(
    name = "test",
    srcs = ["test.py"],
    deps = ["@pip//:numpy"],
)
