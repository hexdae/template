load("@aspect_rules_py//py:defs.bzl", "py_binary")

py_binary(
    name = "poetry",
    srcs = ["poetry.py"],
    args = ["$(location @poetry_prebuilt//:poetry)"],
    data = ["@poetry_prebuilt//:poetry"],
    visibility = ["//visibility:public"],
)
