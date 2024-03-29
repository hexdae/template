load("@npm//:defs.bzl", "npm_link_all_packages")
load("@rules_pycross//pycross:defs.bzl", "pycross_lock_file", "pycross_poetry_lock_model")

package(default_visibility = ["//:__subpackages__"])

# Create the root of the "virtual store" of npm dependencies under bazel-out.
# This must be done in the package where the pnpm workspace is rooted.
npm_link_all_packages(name = "node_modules")

pycross_poetry_lock_model(
    name = "lock_model",
    lock_file = ":poetry.lock",
    project_file = ":pyproject.toml",
)

pycross_lock_file(
    name = "poetry_lock",
    out = "poetry_lock.bzl",
    lock_model_file = ":lock_model",
    target_environments = ["@pycross_environments//:environments"],
)

alias(
    name = "black",
    actual = "//tools/black",
)

alias(
    name = "buildifier",
    actual = "//tools/buildifier",
)

alias(
    name = "cpplint",
    actual = "//tools/cpplint",
)

alias(
    name = "ipython",
    actual = "//tools/ipython",
)

alias(
    name = "mdformat",
    actual = "//tools/mdformat",
)

alias(
    name = "poetry",
    actual = "//tools/poetry",
)

alias(
    name = "pre-commit",
    actual = "//tools/pre-commit",
)

alias(
    name = "python",
    actual = "//tools/python",
)

alias(
    name = "rustfmt",
    actual = "//tools/rustfmt",
)
