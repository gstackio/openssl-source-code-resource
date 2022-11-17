### Improvements

- Now uses HTTPS
- Fixed issue with `check` always reporting a latest version of `3.0.7`, whatever `source.family` was set
- Now setting a `source.family` of `0.9.6` or `0.9.8` is properly supported
- Properly handles `sha1` or `md5` fingerprint checks whenever `sha256` is not provided, fails when no fingerprint can be checked, and still always provides `sha256` in the output artifact directory in order to honor the resource contract
- Resource image is rebuild whenever a new `alpine` base image is published
