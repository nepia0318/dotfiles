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
TARGET_WSL_CONF="/etc/wsl.conf"

mkdir -p "$(dirname "$TARGET_WSL_CONF")"

if [ -e "$TARGET_WSL_CONF" ]; then
    sudo cp "$TARGET_WSL_CONF" "${TARGET_WSL_CONF}_buckup"
fi

sudo ln -fns "${FILE_DIR}/wsl.conf" "$TARGET_WSL_CONF"

# sucess
log_success "${FILE_DIR_BASE}"
