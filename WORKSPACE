load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "jvolkman_rules_pycross",
    remote = "https://github.com/jvolkman/rules_pycross",
    commit = "58b9380a1289b22d0f790ce430f89bcde6a7dcc0",
)

load("@jvolkman_rules_pycross//pycross:repositories.bzl", "rules_pycross_dependencies")

rules_pycross_dependencies()

load("@jvolkman_rules_pycross//pycross:defs.bzl", "pycross_lock_repo")

pycross_lock_repo(
    name = "poetry",
    lock_file = "//toolchain/python/poetry:lock.bzl",
)

load("@poetry//:requirements.bzl", "install_deps")

install_deps()

load("//toolchain/python/poetry:poetry.bzl", "poetry_bin_workspace")

poetry_bin_workspace(name = "poetry_bin")
