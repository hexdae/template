# Python requirements

Requirements can be added to the `requirements.in` file

After adding a requirements, the lockfile needs to be updated

## Updating the lockfile with bazel

This is the prefered method

```bash
bazel run toolchain/python:requirements.update
```

## Manual update

Sometimes packages have small issues that prevent bazel from
resolving dependecies correclty, in that case, we can also run
this command

```
# Requires pip install pip-tools

python -m piptools compile toolchain/python/requirements.in \
    --generate-hashes \
    --no-reuse-hashes \
    -o toolchain/python/requirements_lock.txt
```
