#!/bin/bash

set -eu

# Library/App info
_FILE_DIR="$(cd "$(dirname "$0")"; pwd)"
readonly FILE_DIR=$_FILE_DIR
_FILE_DIR_BASE="$(basename "$FILE_DIR")"
readonly FILE_DIR_BASE=_FILE_DIR_BASE
# printf "\033[32m%s\033[93m%s\033[m%s\n" "[symlink]" "begin" ": ${FILE_DIR_BASE}"

# target base
TARGET_SETTINGS_JSON="${HOME}/temp/symlink_test/.vscode-server/data/Machine/settings.json"

mkdir -p "$(dirname "$TARGET_SETTINGS_JSON")"

if [ -e "$TARGET_SETTINGS_JSON" ]; then
    cp "$TARGET_SETTINGS_JSON" "${TARGET_SETTINGS_JSON}_buckup"
fi

ln -fns "${FILE_DIR}/settings.json" "$TARGET_SETTINGS_JSON"

# sucess
printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[symlink]" ": " "Successfully done " "${FILE_DIR_BASE}"
