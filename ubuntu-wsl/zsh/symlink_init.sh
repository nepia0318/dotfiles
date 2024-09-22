#!/bin/bash

set -eu

# Info
_FILE_DIR="$(cd "$(dirname "$0")"; pwd)"
readonly FILE_DIR=${_FILE_DIR}

log_success () {
    printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[${FILE_NAME}]" ": " "Successfully done " "$1"
}


# .zshenv
TARGET_ZSHENV="${HOME}/.zsh/.zshenv"

mkdir -p "$(dirname "$TARGET_ZSHENV")"

if [ -e "${TARGET_ZSHENV}" ]; then
    cp "${TARGET_ZSHENV}" "${TARGET_ZSHENV}_buckup"
fi

ln -fns "${FILE_DIR}/.zshenv" "${TARGET_ZSHENV}"

# sucess
log_success ".zshenv"
