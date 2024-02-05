load("@rules_oci//oci:defs.bzl", "oci_image", "oci_tarball")

oci_image(
    name = "image",
    base = "@ubuntu",
    entrypoint = ["bash"],
)

oci_tarball(
    name = "tarball",
    image = ":image",
    repo_tags = ["example:oci_image"],
)
