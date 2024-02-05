load("@rules_oci//oci:defs.bzl", "oci_image", "oci_tarball")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

pkg_tar(
    name = "tar",
    srcs = ["//examples/cc"],
    package_dir = "usr/local/bin",
)

oci_image(
    name = "image",
    base = "@ubuntu",
    entrypoint = ["bash"],
    tars = [":tar"],
)

oci_tarball(
    name = "tarball",
    image = ":image",
    repo_tags = ["example:oci_image"],
)
