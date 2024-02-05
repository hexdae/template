load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")

cc_library(
    name = "lib",
    srcs = ["lib.c"],
    hdrs = ["lib.h"],
    visibility = ["//visibility:public"],
)

cc_binary(
    name = "bin",
    srcs = ["main.c"],
    deps = [":lib"],
)

cc_binary(
    name = "cc",
    srcs = ["main.cc"],
    visibility = ["//visibility:public"],
    deps = [":lib"],
)
