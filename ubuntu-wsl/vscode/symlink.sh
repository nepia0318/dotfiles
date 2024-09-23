#!/bin/bash

set -eu

# Info
_FILE_DIR="$(cd "$(dirname "$0")"; pwd)"
readonly FILE_DIR=$_FILE_DIR
_FILE_DIR_BASE="$(basename "$FILE_DIR")"
readonly FILE_DIR_BASE=${_FILE_DIR_BASE}
_FILE_NAME="$(basename "$0")"
readonly FILE_NAME=${_FILE_NAME}

log_success () {
    printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[${FILE_NAME}]" ": " "Successfully done " "$1"
}


# Settings.json
TARGET_SETTINGS_JSON="${HOME}/.vscode-server/data/Machine/settings.json"

mkdir -p "$(dirname "$TARGET_SETTINGS_JSON")"

if [ -e "$TARGET_SETTINGS_JSON" ]; then
    cp "$TARGET_SETTINGS_JSON" "${TARGET_SETTINGS_JSON}_backup"
fi

ln -fns "${FILE_DIR}/settings.json" "$TARGET_SETTINGS_JSON"


# emmet/settings.json
TARGET_EMMET_SNIPETTS_JSON="${HOME}/.vscode-server/data/Machine/snipetts/emmet/emmet_snipetts.json"

mkdir -p "$(dirname "$TARGET_EMMET_SNIPETTS_JSON")"

if [ -e "$TARGET_EMMET_SNIPETTS_JSON" ]; then
    cp "$TARGET_EMMET_SNIPETTS_JSON" "${TARGET_EMMET_SNIPETTS_JSON}_backup"
fi

ln -fns "${FILE_DIR}/emmet_snipetts.json" "$TARGET_EMMET_SNIPETTS_JSON"

# sucess
log_success "${FILE_DIR_BASE}"
