#!/bin/bash

set -eu

# Info
_FILE_DIR=$(cd "$(dirname "$0")" || exit; pwd)
readonly FILE_DIR=${_FILE_DIR}
_FILE_NAME="$(basename "$0")"
readonly FILE_NAME=${_FILE_NAME}

log_begin () {
    printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[${FILE_NAME}]" ": " "Begin " "$1"
}

log_success () {
    printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[${FILE_NAME}]" ": " "Successfully done " "$1"
}


log_begin "init.sh"


# zsh
log_begin "source .zshenv"

# Load zshenv temporary
# shellcheck source=/dev/null
source "${FILE_DIR}/../repo/zsh/.zsh/.zshenv"

log_success "source .zshenv"


# install.sh
log_begin "install.sh"

"${FILE_DIR}/scripts/install.sh"

log_success "install.sh"


# symlink.sh
log_begin "dflink sync"

dflink sync

log_success "dflink sync"


# fast-syntax-hilighting
set +u

eval "$(sheldon source)"
fast-theme zdharma

set -u

# end
log_success "init.sh"
