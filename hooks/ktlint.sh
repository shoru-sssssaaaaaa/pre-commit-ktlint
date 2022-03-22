#!/bin/bash
set -eu
SCRIPT_DIR="$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"
bash "${SCRIPT_DIR}"/_installation.sh

args=()
i=1
for arg in "$@"; do
  snyk_args+=("$arg")
  i=$((i + 1))
done

if [[ $i -gt 1 ]]; then
    echo "Kotlin Format check with Ktlint is running against specified files..."
    ktlint "${snyk_args[*]}"
else
    echo "Kotlin format check with Ktlint is running..."
    ktlint
fi
