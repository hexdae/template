load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

RELEASES = {
    "1.8.2-1": {
        "aarch64-apple-darwin": {
            "sha256": "1437934592f5e5858bc11eb504b14674ad06cc9d80a3703f2a4513ca7aef0734",
            "constraints": [
                "@platforms//os:macos",
                "@platforms//cpu:arm64",
            ],
        },
        "x86_64-apple-darwin": {
            "sha256": "d873b04295bcb9492c26bb0d2aad4bb43bba6da9627f6b7098da06e2e1a03cfe",
            "constraints": [
                "@platforms//os:macos",
                "@platforms//cpu:x86_64",
            ],
        },
        "x86_64-unknown-linux-gnu": {
            "sha256": "9979dca4e2479496b6dbc4b821b79e7fceecf26897a43da25841e5a521b3d8e1",
            "constraints": [
                "@platforms//os:linux",
                "@platforms//cpu:x86_64",
            ],
        },
        "aarch64-unknown-linux-gnu": {
            "sha256": "9ed2155066c4445f35184ef740f6e349afb0fdb8b5ff9b7a0cef8fa28ca2fc41",
            "constraints": [
                "@platforms//os:linux",
                "@platforms//cpu:arm64",
            ],
        },
        "x86_64-pc-windows-msvc": {
            "sha256": "60dad16e9587eba92a67fad2c993452f9a21e883ca2968ec8fd01670a08f4188",
            "constraints": [
                "@platforms//os:windows",
                "@platforms//cpu:x86_64",
            ],
        },
    },
    "1.7.0-1": {
        "aarch64-apple-darwin": {
            "sha256": "b529726b5d32cabd353f09da31b680059868d80e46dfeb5cc83c75e4d0ae969d",
            "constraints": ["@platforms//os:macos", "@platforms//cpu:arm64"],
        },
        "x86_64-apple-darwin": {
            "sha256": "0fa8583de7ac256182be03d2346a7909afe6979558e14a26a04a6d5726977005",
            "constraints": ["@platforms//os:macos", "@platforms//cpu:x86_64"],
        },
        "x86_64-unknown-linux-gnu": {
            "sha256": "03ee204da7cd2161e6a7ae6041b129f9f1f62ec713d42879babfcc8ee22b05c6",
            "constraints": ["@platforms//os:linux", "@platforms//cpu:x86_64"],
        },
        "aarch64-unknown-linux-gnu": {
            "sha256": "8cb1d92e6bd2e0a7604d38e3efe3d875c3d37a1d45230fe8f2517b6832a622f7",
            "constraints": ["@platforms//os:linux", "@platforms//cpu:arm64"],
        },
        "x86_64-pc-windows-msvc": {
            "sha256": "5f04e8b70d8a0e4adec61af1a2bf102d8e3093e0a6928de5fafe319599d5315c",
            "constraints": ["@platforms//os:windows", "@platforms//cpu:x86_64"],
        },
    },
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
        },
    },
}

BUILD = """
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
    out = "poetry_bin",
    visibility = ["//visibility:public"],
)
"""

def _poetry_bin_repo_impl(ctx):
    ctx.file(
        "BUILD.bazel",
        BUILD.format(
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

def poetry_bin_workspace(name = "poetry_bin", version = "1.8.2-1", releases = RELEASES, template = None):
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
            build_file_content = "exports_files(['poetry'])",
        )

    poetry_bin_repo(
        name = name,
        release = {
            arch: release.get("constraints")
            for arch, release in releases.get(version).items()
        },
    )
