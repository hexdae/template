load("@rules_python//python:pip.bzl", "compile_pip_requirements")
load("@pip//:requirements.bzl", "all_requirements")

# This rule adds a convenient way to update the requirements file.
compile_pip_requirements(
    name = "requirements",
    extra_args = [
        "--allow-unsafe",
        "--no-reuse-hashes",
        "--resolver=backtracking",
    ],
    requirements_in = "requirements.in",
    requirements_txt = "requirements_lock.txt",
    visibility = ["//visibility:public"],
    tags = ["manual"],
)

py_binary(
    name = "python",
    srcs = ["python.py"],
    deps = all_requirements,
    visibility = ["//visibility:public"],
)

py_binary(
    name = "ipython",
    srcs = ["ipython.py"],
    deps = all_requirements,
    visibility = ["//visibility:public"],
)

exports_files([
    "jupyter.py",
])
