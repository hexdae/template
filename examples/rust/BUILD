load("@rules_rust//rust:defs.bzl", "rust_binary", "rust_library", "rust_test")

rust_library(
    name = "foo",
    srcs = ["src/foo.rs"],
)

rust_test(
    name = "test",
    crate = ":foo",
)

rust_binary(
    name = "rust",
    srcs = [
        "src/foo.rs",
        "src/main.rs",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "@crates//:anyhow",
    ],
)
