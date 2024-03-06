import requests
import json

# Define the base URL and version
base_url = "https://github.com/gi0baro/poetry-bin/releases/download"
version = "1.8.2-1"

# Define the architectures for which you want to download the SHA sum files
architectures = [
    "aarch64-apple-darwin",
    "x86_64-apple-darwin",
    "x86_64-unknown-linux-gnu",
    "aarch64-unknown-linux-gnu",
    "x86_64-pc-windows-msvc",
]

# Mapping for constraints based on architecture
constraints_mapping = {
    "aarch64-apple-darwin": ["@platforms//os:macos", "@platforms//cpu:arm64"],
    "x86_64-apple-darwin": ["@platforms//os:macos", "@platforms//cpu:x86_64"],
    "x86_64-unknown-linux-gnu": ["@platforms//os:linux", "@platforms//cpu:x86_64"],
    "aarch64-unknown-linux-gnu": ["@platforms//os:linux", "@platforms//cpu:arm64"],
    "x86_64-pc-windows-msvc": ["@platforms//os:windows", "@platforms//cpu:x86_64"],
}

# Initialize the dictionary to store the results
result = {version: {}}

for arch in architectures:
    # Construct the URL
    sha_url = f"{base_url}/{version}/poetry-bin-{version}-{arch}.sha256sum"

    # Attempt to download the SHA sum file
    try:
        response = requests.get(sha_url)
        response.raise_for_status()  # Raise an error for bad responses
        sha256 = response.text.split()[
            0
        ]  # Assume the SHA is the first part of the response

        # Populate the dictionary
        result[version][arch] = {
            "sha256": sha256,
            "constraints": constraints_mapping[arch],
        }

    except requests.RequestException as e:
        print(f"Error downloading {sha_url}: {e}")

# Print the result in JSON format
print(json.dumps(result, indent=4))
