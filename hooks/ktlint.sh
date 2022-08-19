#!/bin/bash
set -eu
SCRIPT_DIR="$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"
bash "${SCRIPT_DIR}"/_installation.sh

i=1
for arg in "$@"; do
  ktlint_args+=("$arg")
  i=$((i + 1))
done

if [[ $i -gt 1 ]]; then
    echo "Kotlin Format check with ktlint is running against specified files..."
    echo "${ktlint_args[*]}"
    ktlint "${ktlint_args[*]}"
else
    echo "Kotlin format check with ktlint is running..."
    ktlint
fi
echo "Kotlin format check finished"
