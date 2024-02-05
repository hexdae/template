""" Constraints for different platforms. """

constraints = struct(
    darwin_x86_64 = [
        "@platforms//os:macos",
        "@platforms//cpu:x86_64",
    ],
    darwin_arm64 = [
        "@platforms//os:macos",
        "@platforms//cpu:arm64",
    ],
    linux_arm64 = [
        "@platforms//os:linux",
        "@platforms//cpu:arm64",
    ],
    linux_x86_64 = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
    windows_x86_64 = [
        "@platforms//os:windows",
        "@platforms//cpu:x86_64",
    ],
)
