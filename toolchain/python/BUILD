# load("@pip//:requirements.bzl", "all_requirements")

py_binary(
    name = "python",
    srcs = ["tools/python.py"],
    main = "tools/python.py",
    visibility = ["//visibility:public"],
    # deps = ["@pip//:all"],
)

py_binary(
    name = "ipython",
    srcs = ["tools/ipython.py"],
    main = "tools/ipython.py",
    visibility = ["//visibility:public"],
    deps = ["@pip//:ipython"],
)

exports_files([
    "tools/jupyter.py",
])
