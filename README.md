<p align="center">

<img src=https://github.com/hexdae/template/actions/workflows/linux.yml/badge.svg href=https://github.com/hexdae/template/actions/workflows/linux.yml>
<img src=https://github.com/hexdae/template/actions/workflows/mac.yml/badge.svg href=https://github.com/hexdae/template/actions/workflows/mac.yml>

</p>

# Bazel template

A template to start a bazel project.

## Toolchains

- C/C++ (hermetic toolchain)
- Python (hermetic toolchain)
- Jupyter (hermetic pip dep)
- Rust (hermetic toolchain)

## Tools

- Black (Python): `bazel run black`
- Buildifier: `bazel run buildifier`
- Cpplint (C/C++): `bazel run cpplint`
- Pre Commit: `bazel run pre-commit`
- Poetry: `bazel run poetry`
