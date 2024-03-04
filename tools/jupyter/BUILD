load("@aspect_rules_py//py:defs.bzl", "py_binary")
load("@pip//:requirements.bzl", "all_requirements")

py_binary(
    name = "jupyter",
    srcs = ["jupyter.py"],
    main = "jupyter.py",
    visibility = ["//visibility:public"],
    deps = all_requirements,
)

exports_files(["jupyter.py"])
