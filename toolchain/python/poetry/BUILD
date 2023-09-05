load("//platform:platform.bzl", "constraints")
load("@bazel_skylib//rules:write_file.bzl", "write_file")
load(
    "@jvolkman_rules_pycross//pycross:defs.bzl",
    "pycross_lock_file",
    "pycross_poetry_lock_model",
    "pycross_target_environment",
)

pycross_target_environment(
    name = "python_windows_x86_64",
    abis = ["cp39"],
    platforms = ["windows"],
    python_compatible_with = constraints.windows_x86_64,
    version = "3.9.12",
    visibility = ["//visibility:public"],
)


pycross_target_environment(
    name = "python_darwin_x86_64",
    abis = ["cp39"],
    platforms = ["macosx_12_0_x86_64"],
    python_compatible_with = constraints.darwin_x86_64,
    version = "3.9.12",
    visibility = ["//visibility:public"],
)

pycross_target_environment(
    name = "python_darwin_arm64",
    abis = ["cp39"],
    platforms = ["macosx_12_0_arm64"],
    python_compatible_with = constraints.darwin_arm64,
    version = "3.9.12",
    visibility = ["//visibility:public"],
)

pycross_target_environment(
    name = "python_linux_x86_64",
    abis = ["cp39"],
    platforms = [
        "linux_x86_64",
        "manylinux2014_x86_64",
    ] + [
        "manylinux_2_%s_x86_64" % str(i)
        for i in range(17, 25)
    ],
    python_compatible_with = constraints.linux_x86_64,
    version = "3.9.12",
    visibility = ["//visibility:public"],
)

pycross_poetry_lock_model(
    name = "poetry_lock_model",
    poetry_lock_file = "poetry.lock",
    poetry_project_file = "pyproject.toml",
)

pycross_lock_file(
    name = "poetry_lock",
    out = "lock.bzl",
    default_alias_single_version = True,
    lock_model_file = ":poetry_lock_model",
    pypi_index = "https://pypi.org",
    target_environments = [
        ":python_darwin_x86_64",
        ":python_darwin_arm64",
        ":python_linux_x86_64",
        # ":python_windows_x86_64", #TODO: enable
    ],
)

write_file(
    name = "gen_update",
    out = "update.sh",
    content = [
        "#!/usr/bin/env bash",
        "cd $BUILD_WORKSPACE_DIRECTORY",
        "set -eu",
        "bazel-bin/external/poetry_bin/poetry_bin -C toolchain/python/poetry lock",
        "cp -fv bazel-bin/toolchain/python/poetry/lock.bzl toolchain/python/poetry/lock.bzl",
    ],
)

sh_binary(
    name = "update",
    srcs = ["update.sh"],
    data = [
        "@poetry_bin//:poetry",
        ":lock.bzl",
    ],
    visibility = ["//visibility:public"],
)

write_file(
    name = "gen_poetry",
    out = "poetry.sh",
    content = [
        "#!/usr/bin/env bash",
        "set -eu",
        "cd $BUILD_WORKSPACE_DIRECTORY",
        "POETRY=bazel-bin/external/poetry_bin/poetry_bin",
        "$POETRY -C toolchain/python/poetry $@",
        "$POETRY -C toolchain/python/poetry lock",
        "bazel build --config=quiet toolchain/python/poetry:poetry_lock",
        "cp -fv bazel-bin/toolchain/python/poetry/lock.bzl toolchain/python/poetry/lock.bzl",
    ],
)

sh_binary(
    name = "poetry",
    srcs = ["poetry.sh"],
    data = [
        "@poetry_bin//:poetry",
        ":lock.bzl",
        ":pyproject.toml",
        ":poetry.lock",
    ],
    visibility = ["//visibility:public"],
)
