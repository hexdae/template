load("@aspect_rules_py//py:defs.bzl", "py_binary")

py_binary(
    name = "cpplint",
    srcs = ["cpplint.py"],
    visibility = ["//visibility:public"],
    deps = [
        "@pip//:cpplint",
    ],
)
