load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

RELEASES = {
    "1.6.0-1": {
        "aarch64-apple-darwin": {
            "sha256": "3a4732c7c2872184e8e88e97ea7ac50a8f7679e7bcf6c9a7a0176717940c08a5",
            "constraints": ["@platforms//os:macos", "@platforms//cpu:arm64"],
        },
        "x86_64-apple-darwin": {
            "sha256": "e11435fbebc0b3e3408fb67491167ce8512c7a7a009e58140ecdc5f72f56b2cb",
            "constraints": ["@platforms//os:macos", "@platforms//cpu:x86_64"],
        },
        "x86_64-unknown-linux-gnu": {
            "sha256": "1c7a7de4ff305263fbc5471916eba8479d463236a0fe36b963e9de7c8d44e20b",
            "constraints": ["@platforms//os:linux", "@platforms//cpu:x86_64"],
        },
        "aarch64-unknown-linux-gnu": {
            "sha256": "3ef20a32f8ee0629f7de083cf6ee4ffe62134667119d08f3d53b27e01e7989b4",
            "constraints": ["@platforms//os:linux", "@platforms//cpu:arm64"],
        },
        "x86_64-pc-windows-msvc": {
            "sha256": "c88c7ff3fe6c3e2dc8df7fa335080389fdf31959658bf5a7bb49595e30d6136a",
            "constraints": ["@platforms//os:windows", "@platforms//cpu:x86_64"],
        }
    },
}

ARCHIVE_BUILD = """
filegroup(
    name = "files",
    srcs = glob([
        "assets/**",
        "lib/**",
    ]),
    visibility = ["//visibility:public"],
)

exports_files(["poetry"])
"""

REPO_BUILD = """
load("@bazel_skylib//rules:native_binary.bzl", "native_binary")

RELEASE = {release}
ARCHS = RELEASE.keys()

[
     config_setting(
        name = "config_{{}}".format(arch),
        constraint_values = constraints,
    )
    for arch, constraints in RELEASE.items()
]

native_binary(
    name = "poetry",
    src = select({{
        ":config_{{arch}}".format(arch=arch):
        "@{name}_{{arch}}//:poetry".format(arch = arch)
        for arch in ARCHS
    }}),
    data = select({{
        "config_{{arch}}".format(arch=arch):
        ["@{name}_{{arch}}//:files".format(arch = arch)]
        for arch in ARCHS
    }}),
    out = "poetry_bin",
    visibility = ["//visibility:public"],
)
"""

def _poetry_bin_repo_impl(ctx):
    ctx.file(
        "BUILD.bazel",
        REPO_BUILD.format(
            name = ctx.name,
            release = ctx.attr.release,
        ),
    )

poetry_bin_repo = repository_rule(
    implementation = _poetry_bin_repo_impl,
    local = True,
    attrs = {
        "release": attr.string_list_dict(mandatory = True),
    },
)

def poetry_bin_workspace(name = "poetry_bin", version = "1.6.0-1", releases = RELEASES, template = None):
    """Add all the workspace dependencies for poetry binaries.

    Args:
        name: name of the tool repo
        version: version to use
        releases: dictionary with releases info -> version: {arch: {sha256: "", constraints: []}}
        template: default None
    """

    url = "https://github.com/gi0baro/poetry-bin/releases/download"
    template = template or url + "/{version}/poetry-bin-{version}-{arch}.tar.gz"

    for arch, release in releases.get(version).items():
        http_archive(
            name = "{}_{}".format(name, arch),
            url = template.format(version = version, arch = arch),
            sha256 = release.get("sha256"),
            build_file_content = ARCHIVE_BUILD,
        )

    poetry_bin_repo(
        name = name,
        release = {
            arch: release.get("constraints")
            for arch, release in releases.get(version).items()
        },
    )
