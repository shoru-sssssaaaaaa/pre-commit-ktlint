#!/bin/bash
set -eu
if ! command -v ktlint &> /dev/null
then
  echo "Installing ktlint..."
  if ! command -v brew &> /dev/null
  then
    curl -sSLO https://github.com/pinterest/ktlint/releases/download/0.46.1/ktlint && chmod a+x ktlint
    echo "Installation done"
    echo "Verifying ktlint..."
    curl -sS https://keybase.io/ktlint/pgp_keys.asc | gpg --import
    curl -sSLO https://github.com/pinterest/ktlint/releases/download/0.46.1/ktlint.asc
    if gpg --verify ktlint.asc ktlint ; then
      echo "Verification passed"
      rm -f ktlint.asc
      mv ktlint /usr/local/bin/ktlint
    else
      echo -e "Verification failed"
      echo "Uninstalling ktlint..."
      rm -f ktlint.asc
      rm -f ktlint
      echo "klint uninstalled"
      exit 1
    fi
  else
    brew install ktlint
    echo "Installation done"
  fi
fi
