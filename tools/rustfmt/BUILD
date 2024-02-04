load("@rules_python//python:defs.bzl", "py_binary")

py_binary(
    name = "rustfmt",
    srcs = ["rustfmt.py"],
    data = [
        "@rules_rust//rust/toolchain:current_rustfmt_toolchain",
    ],
    env = {
        "RUSTFMT": "$(rootpath @rules_rust//rust/toolchain:current_rustfmt_toolchain)",
    },
    toolchains = [
        "@rules_rust//rust/toolchain:current_rustfmt_toolchain",
    ],
    visibility = ["//visibility:public"],
)
