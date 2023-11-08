load("@rules_python//python:defs.bzl", "py_binary", "py_library", "py_test")
load("@poetry//:requirements.bzl", "requirement")

py_library(
    name = "library",
    srcs = ["library.py"],
    visibility = ["//visibility:public"],
)

py_binary(
    name = "binary",
    srcs = ["main.py"],
    main = "main.py",
    deps = [":library"],
    visibility = ["//visibility:public"],
)

py_test(
    name = "test",
    srcs = ["test.py"],
    deps = [

        requirement("numpy"),

    ],
)
