load("@pip//:requirements.bzl", "all_requirements")
load("@aspect_rules_py//py:defs.bzl", "py_binary")

py_binary(
    name = "python",
    srcs = ["python.py"],
    main = "python.py",
    visibility = ["//visibility:public"],
    deps = all_requirements,
)
