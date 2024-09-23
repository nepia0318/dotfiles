#!/bin/bash

set -eu

# Info
_FILE_DIR="$(cd "$(dirname "$0")"; pwd)"
readonly FILE_DIR=$_FILE_DIR
_FILE_NAME="$(basename "$0")"
readonly FILE_NAME=${_FILE_NAME}

log_begin () {
    printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[${FILE_NAME}]" ": " "Begin " "$1"
}

log_success () {
    printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[${FILE_NAME}]" ": " "Successfully done " "$1"
}


log_begin "vscode_install"

# apt install
while read -r line
do
    code --install-extension "${line}"
    log_success "vscode/${line}"
done < "${FILE_DIR}/../vscode/extensions.txt"

log_success "vscode_install"
