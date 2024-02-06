load("//platform:platform.bzl", "constraints")

package(default_visibility = ["//visibility:public"])

platform(
    name = "linux_x86_64",
    constraint_values = constraints.linux_x86_64,
)

alias(
    name = "linux_amd64",
    actual = "linux_x86_64",
)

platform(
    name = "linux_arm64",
    constraint_values = constraints.linux_arm64,
)

platform(
    name = "darwin_x86_64",
    constraint_values = constraints.darwin_x86_64,
)

alias(
    name = "darwin_amd64",
    actual = "darwin_x86_64",
)

platform(
    name = "darwin_arm64",
    constraint_values = constraints.darwin_arm64,
)

platform(
    name = "windows_x86_64",
    constraint_values = constraints.windows_x86_64,
)

alias(
    name = "windows_amd64",
    actual = "windows_x86_64",
)
