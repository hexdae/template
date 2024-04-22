load("@aspect_bazel_lib//lib:transitions.bzl", "platform_transition_binary")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_tarball")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load(":py_layer.bzl", "py_layers")

pkg_tar(
    name = "tar_cc",
    srcs = ["//examples/cc"],
    package_dir = "usr/local/bin",
)

pkg_tar(
    name = "tar_rust",
    srcs = ["//examples/rust"],
    package_dir = "usr/local/bin",
)

py_layers(
    name = "tar_python",
    binary = "//examples/python",
)

oci_image(
    name = "image",
    base = "@ubuntu",
    entrypoint = ["/bin/bash"],
    tars = [
        ":tar_cc",
        ":tar_rust",
        ":tar_python.interpreter_layer",
        ":tar_python.packages_layer",
        ":tar_python.app_layer",
    ],
)

oci_tarball(
    name = "tarball",
    image = ":image",
    repo_tags = ["example:oci"],
)

platform_transition_binary(
    name = "arm64",
    binary = ":tarball",
    target_platform = "//platform:linux_arm64",
)

platform_transition_binary(
    name = "amd64",
    binary = ":tarball",
    target_platform = "//platform:linux_amd64",
)
