load("@rules_oci//oci:defs.bzl", "oci_image", "oci_tarball")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

pkg_tar(
    name = "tar_cc",
    srcs = ["//examples/cc"],
    package_dir = "usr/local/bin",
)

oci_image(
    name = "image",
    base = "@distroless_base",
    entrypoint = ["/usr/local/bin/cc"],
    tars = [":tar_cc"],
)

oci_tarball(
    name = "tarball",
    image = ":image",
    repo_tags = ["example:oci_image"],
)
