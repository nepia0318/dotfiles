#!/bin/zsh

set -eu

# Library/App info
readonly FILE_DIR=$(cd $(dirname $0); pwd)
readonly FILE_DIR_BASE=$(basename $FILE_DIR)
# printf "\033[32m%s\033[93m%s\033[m%s\n" "[symlink]" "begin" ": ${FILE_DIR_BASE}"

# target base
TARGET_SETTINGS_JSON="${HOME}/temp/symlink_test/.vscode-server/data/Machine/settings.json"

mkdir -p $(dirname $TARGET_SETTINGS_JSON)
ln -fns "${FILE_DIR}/settings.json" $TARGET_SETTINGS_JSON

# sucess
printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[symlink]" ": " "Successfully done " "${FILE_DIR_BASE}"
