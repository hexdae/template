load("@poetry//:requirements.bzl", "all_requirements")

py_binary(
    name = "python",
    main = "tools/python.py",
    srcs = ["tools/python.py"],
    deps = all_requirements,
    visibility = ["//visibility:public"],
)

py_binary(
    name = "ipython",
    main = "tools/ipython.py",
    srcs = ["tools/ipython.py"],
    deps = all_requirements,
    visibility = ["//visibility:public"],
)

exports_files([
    "tools/jupyter.py",
])
