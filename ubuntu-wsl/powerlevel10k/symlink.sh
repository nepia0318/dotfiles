#!/bin/bash

set -eu

# Info
_FILE_DIR="$(cd "$(dirname "$0")"; pwd)"
readonly FILE_DIR=$_FILE_DIR
_FILE_DIR_BASE="$(basename "$FILE_DIR")"
readonly FILE_DIR_BASE=_FILE_DIR_BASE
_FILE_NAME="$(basename "$0")"
readonly FILE_NAME=${_FILE_NAME}

log_success () {
    printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[${FILE_NAME}]" ": " "Successfully done " "$1"
}


# target base
TARGET_P10K_ZSH="${HOME}/.p10k.zsh"

mkdir -p "$(dirname "$TARGET_P10K_ZSH")"

if [ -e "$TARGET_P10K_ZSH" ]; then
    cp "$TARGET_P10K_ZSH" "${TARGET_SETTINGS_JSON}_buckup"
fi

ln -fns "${FILE_DIR}/.p10k.zsh" "$TARGET_P10K_ZSH"

# sucess
log_success "${FILE_DIR_BASE}"
