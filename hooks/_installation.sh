#!/usr/bin/env sh
set -eu

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

install_ktlint() {
  if command -v ktlint &> /dev/null; then
    ktlint_path="$(which ktlint)"
  else
    log_info "Installing ktlint..."
    if command -v brew &> /dev/null; then
      brew install ktlint
      log_info "Installation done"
      ktlint_path="$(which ktlint)"
    else
      curl -sSLO https://github.com/pinterest/ktlint/releases/download/1.5.0/ktlint && chmod a+x ktlint
      log_info "Installation done"
      log_info "Verifying ktlint..."
      curl -sS https://keybase.io/ktlint/pgp_keys.asc | gpg --import
      curl -sSLO https://github.com/pinterest/ktlint/releases/download/1.5.0/ktlint.asc
      if gpg --verify ktlint.asc ktlint ; then
        log_info "Verification passed"
        rm -f ktlint.asc
        ktlint_path="$(pwd)/ktlint"
      else
        log_error "Verification failed"
        log_info "Uninstalling ktlint..."
        rm -f ktlint.asc
        rm -f ktlint
        log_info "klint uninstalled"
        exit 1
      fi
    fi
  fi
  echo "${ktlint_path}"
}
