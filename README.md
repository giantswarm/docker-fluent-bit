[![Docker Repository on Quay](https://quay.io/repository/giantswarm/docker-fluent-bit/status "Docker Repository on Quay")](https://quay.io/repository/giantswarm/docker-fluent-bit)
[![CircleCI](https://circleci.com/gh/giantswarm/docker-fluent-bit.svg?style=svg&circle-token=f62e659d9aa2319853e79aad2dbccd8afa476f0f)](https://circleci.com/gh/giantswarm/docker-fluent-bit)

# docker-fluent-bit

Docker image for the [fluent-bit](https://github.com/fluent/fluent-bit) log processor

The configuration in the `conf` directory is meant to serve as a default. The directory
is available in the final image as `/etc/fluent`.

To overwrite the configuration, you can mount your own configuration directory
and (if necessary) set the correct config path at runtime as a command argument.
By default, the command is:

    /usr/local/bin/fluent-bit --config=/etc/fluent/fluent-bit.conf
