# Ubuntu Docker image with en_US.UTF-8 and ru_RU.UTF-8 locales

Dockerfile to build a ubuntu:16.04 baseimage with a couple of extra packages.

The image is built on top of the most recently tagged `ubuntu:16.04` image and installs the following extra packages:

- `vim.tiny`
- `wget`
- `sudo`
- `net-tools`
- `ca-certificates`
- `unzip`
- `locales`
- `apt-utils`

The packages are selected based on the criteria that they are commonly used and that they do not influence the size of the resulting image too much.

Additionally `apt` is configured to **NOT** install `recommended` and `suggested` packages.

