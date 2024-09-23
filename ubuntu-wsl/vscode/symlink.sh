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


BASE_FILES=(
    "${FILE_DIR}/settings.json"
    "${FILE_DIR}/emmet_snippets.json"
    "${FILE_DIR}/md2pdf.css"
)

TARGET_FILES=(
    "${HOME}/.vscode-server/data/Machine/settings.json"
    "${HOME}/.vscode-server/data/Machine/Emmet/emmet_snippets.json"
    "${HOME}/.vscode-server/data/Machine/Markdown_PDF/md2pdf.css"
)

for i in "${!BASE_FILES[@]}"
do
    mkdir -p "$(dirname "${TARGET_FILES[$i]}")"

    if [ -e "${TARGET_FILES[$i]}" ]; then
        cp "${TARGET_FILES[$i]}" "${TARGET_FILES[$i]}_backup"
    fi

    ln -fns "${BASE_FILES[$i]}" "${TARGET_FILES[$i]}"
done


# sucess
log_success "${FILE_DIR_BASE}"
