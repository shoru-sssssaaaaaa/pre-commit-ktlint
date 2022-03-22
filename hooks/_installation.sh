#!/bin/bash
set -eu
if ! command -v ktlint &> /dev/null
then
    curl -sSLO https://github.com/pinterest/ktlint/releases/download/0.45.1/ktlint && chmod a+x ktlint
fi
