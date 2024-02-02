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
