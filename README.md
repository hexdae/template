<p align="center">

<img src=https://github.com/hexdae/template/actions/workflows/linux.yml/badge.svg href=https://github.com/hexdae/template/actions/workflows/linux.yml>
<img src=https://github.com/hexdae/template/actions/workflows/mac.yml/badge.svg href=https://github.com/hexdae/template/actions/workflows/mac.yml>

</p>

# Bazel template

A template to start a `bazel` project.

## Toolchains

- C/C++
- Rust
- Python
- Jupyter Notebook
- OCI Containers
- Node (JS) + Next + Webpack

# Cross compilation

The repo natively support cross compilation wherever possible. This is handy
for building docker containers on MacOS.

- Python (rules_pycross)
- C/C++ (hermetic_cc_toolchain)
- Rust (extra_target_toolchains)

# Tools

Convenience tools for linting and developer experience are bundled under the
[tools](./tools/) directory
