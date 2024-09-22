#!/bin/bash

set -eu

# Library/App info
_FILE_DIR="$(cd "$(dirname "$0")"; pwd)"
readonly FILE_DIR=${_FILE_DIR}
# printf "\033[32m%s\033[93m%s\033[m%s\n" "[symlink]" "begin" ": ${FILE_DIR_BASE}"

# .zshenv
TARGET_ZSHENV="${HOME}/.zsh/.zshenv"

mkdir -p "$(dirname "$TARGET_ZSHENV")"

if [ -e "${TARGET_ZSHENV}" ]; then
    cp "${TARGET_ZSHENV}" "${TARGET_ZSHENV}_buckup"
fi

ln -fns "${FILE_DIR}/.zshenv" "${TARGET_ZSHENV}"

# sucess
printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[symlink]" ": " "Successfully done " ".zshenv"
