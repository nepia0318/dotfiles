#!/bin/bash

set -eu

# Info
_FILE_DIR="$(cd "$(dirname "$0")"; pwd)"
readonly FILE_DIR=${_FILE_DIR}
_FILE_DIR_BASE="$(basename "$FILE_DIR")"
readonly FILE_DIR_BASE=${_FILE_DIR_BASE}
_FILE_NAME="$(basename "$0")"
readonly FILE_NAME=${_FILE_NAME}

log_success () {
    printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[${FILE_NAME}]" ": " "Successfully done " "$1"
}

# .gitconfig
TARGET_GITCONFIG="${HOME}/.gitconfig"

mkdir -p "$(dirname "$TARGET_GITCONFIG")"

if [ -e "${TARGET_GITCONFIG}" ]; then
    cp "${TARGET_GITCONFIG}" "${TARGET_GITCONFIG}_backup"
fi

ln -fns "${FILE_DIR}/.gitconfig" "${TARGET_GITCONFIG}"


# sucess
log_success "${FILE_DIR_BASE}"
