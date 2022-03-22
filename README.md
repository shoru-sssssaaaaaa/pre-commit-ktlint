# pre-commit-ktlint

This project provides utilities for ensuring that your Kotlin code is nicely formatted by using [pre-commit](https://pre-commit.com/) hooks

### Example usage

```yaml
- repo: https://github.com/shoru-sssssaaaaaa/pre-commit-ktlint
    rev: v0.0.5
    hooks:
      - id: format-kotlin
        args: ["src/**/*.kt", "!src/**/*Test.kt"]
        stages: ["commit"]
```

### Related Guide

KTlint: https://ktlint.github.io/
