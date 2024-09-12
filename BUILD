load("@npm//:defs.bzl", "npm_link_all_packages")

package(default_visibility = ["//:__subpackages__"])

# Create the root of the "virtual store" of npm dependencies under bazel-out.
# This must be done in the package where the pnpm workspace is rooted.
npm_link_all_packages(name = "node_modules")

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
