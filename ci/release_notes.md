### Improvements

- Built resource image on top of Alpine 3.21.3

### Caveat

This Concourse resource does not support version families `3.3` and `3.4`, now that souce code tarballs are no more shipped as they were before.

As these are now [released on GitHub][openssl_gh], you may use the `github-release` resource instead.

[openssl_gh]: https://github.com/openssl/openssl/releases
