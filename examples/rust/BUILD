load("@rules_rust//rust:defs.bzl", "rust_binary", "rust_library", "rust_test")

rust_library(
    name = "lib",
    srcs = ["src/lib.rs"],
)

rust_test(
    name = "test",
    crate = ":lib",
)

rust_binary(
    name = "bin",
    srcs = ["src/main.rs"],
    deps = [":lib"],
)
