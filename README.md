# OpenSSL source code Resource

OpenSSL source code is made available via [openssl.org/source][openssl_source]
or the [artfiles.org mirror][artfiles_mirror]. This Concourse resource allows
you to watch for new releases and fetch them.

[openssl_source]: https://www.openssl.org/source/
[artfiles_mirror]: http://artfiles.org/openssl.org/source/


## Using in a Concourse pipeline

You can use the Docker image by defining a [resource type][resource_types] in
your pipeline YAML definition.

[resource_types]: https://concourse-ci.org/resource-types.html

For example:

```yaml
resource_types:
  - name: openssl-source-code
    type: docker-image
    source:
      repository: gstack/openssl-source-code-resource

resources:
  - name: openssl-tarball
    type: openssl-source-code
    source:
      family: "1.1.1"
```

To get the latest OpenSSL v1.1.1 tarball, use such following `get` step in
your job's build plan.

```yaml
jobs:
  - name: compile
    plan:
      - get: openssl-tarball
      # ...
```

## Source Configuration

- `family`: *Required.* The OpenSSL version family, like `3.0` or `1.1.1`
  (recommended), or the non-recommended `1.1.0`, `1.0.2`, `1.0.1`, `1.0.0`,
  `0.9.8`, `0.9.7` and `0.9.6`.

## Behavior

### `check` Step (`check` script): Check for new release versions

Get the latest version of OpenSSL source code in the defined version family.

### `get` Step (`in` script): Fetch release

Downloads the source code tarball for a version.

Also creates these files in the output artifact directory:

* `version` file with the current version
* `family` file with the version family
* `sha256` file with the SHA256 checksum from OpenSSL site (already verified at
  download by the resource)

Whenever the `sha256` is not provided by the openssl.org download site, then
`sha1` is tried and checked, then `md5`. Which fingerprint is checked is
detailed in the resource logs, and related files are kept in the output artifact
directory. When non is ab-vailable, the resource fails. Whenever the `sha256`
file is missing, it is computed from the downloaded file, in order to honor the
resource contract.

### `put` Step (`out` script): Not implemented

Uploading a new OpenSSL source code tarball is not possible.



<!-- START_OF_DOCKERHUB_STRIP -->

## Development

## Build docker image

```
docker_user=gstack
docker build -t "${docker_user}/openssl-source-code-resource" .
docker push ${docker_user}/openssl-source-code-resource
```

### Running the tests

The tests are run by the `test` job of the concourse pipeline. You may run parts
or all of the Bash script defined in `ci/settings.yml`. Pull requests are
welcome for improving this, extracting the Bash script, create some Makefile and
have them run locally with `make test`.

### Contributing

Please make all pull requests to the `master` branch and ensure tests pass
locally.

When submitting a Pull Request or pushing new commits, the Concourse CI/CD
pipeline provides feedback with building the Dockerfile, which implies
running the tests.

<!-- END_OF_DOCKERHUB_STRIP -->



## Author and License

Copyright © 2021-present, Benjamin Gandon, Gstack

Like Concourse, the OpenSSL source code resource is released under the terms of
the [Apache 2.0 license](http://www.apache.org/licenses/LICENSE-2.0).

<!--
# Local Variables:
# indent-tabs-mode: nil
# End:
-->
