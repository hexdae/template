load("@rules_pycross//pycross:defs.bzl", "pycross_lock_file", "pycross_poetry_lock_model")

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
    name = "cpplint",
    actual = "//tools/cpplint",
)

alias(
    name = "ipython",
    actual = "//toolchain/python:ipython",
)

alias(
    name = "pre-commit",
    actual = "//tools/pre-commit",
)

alias(
    name = "python",
    actual = "//toolchain/python",
)
