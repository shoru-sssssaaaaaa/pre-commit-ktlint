# Klint pre-commit hooks

[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/shoru-sssssaaaaaa/pre-commit-ktlint/main.svg)](https://results.pre-commit.ci/latest/github/shoru-sssssaaaaaa/pre-commit-ktlint/main)

1. [format-kotlin](#format-kotlin)

## Description

Take into account that in case `ktlint` is not installed locally it will be
automatically installed **globally**. For that it requires some additional
dependencies to be installed in advance (please use one of the options below).

- [brew](https://brew.sh/)
- [curl](https://curl.se/) and [gnupg](https://www.gnupg.org/)

## Documentation

<!-- markdownlint-disable-next-line MD013 -->
> `<rev>` in the examples below, is the latest revision tag from [shoru-sssssaaaaaa/pre-commit-ktlint](https://github.com/shoru-sssssaaaaaa/pre-commit-ktlint/releases)
> repository.

### format-kotlin

```yaml
repos:
  - repo: https://github.com/shoru-sssssaaaaaa/pre-commit-ktlint
    rev: <rev>
    hooks:
      - id: format-kotlin
        args: ["src/**/*.kt"]
```

> `args` is optional. In this example you can run `ktlint` on specific path.
