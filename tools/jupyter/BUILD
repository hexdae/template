load("@pip//:requirements.bzl", "all_requirements")
load("@rules_python//python:defs.bzl", "py_binary")

py_binary(
    name = "jupyter",
    srcs = ["jupyter.py"],
    main = "jupyter.py",
    visibility = ["//visibility:public"],
    deps = all_requirements,
)

exports_files(["jupyter.py"])
