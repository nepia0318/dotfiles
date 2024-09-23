#!/bin/bash

set -eu

# Info
_FILE_DIR="$(cd "$(dirname "$0")"; pwd)"
readonly FILE_DIR=${_FILE_DIR}
_FILE_NAME="$(basename "$0")"
readonly FILE_NAME=${_FILE_NAME}

log_begin () {
    printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[${FILE_NAME}]" ": " "Begin " "$1"
}

log_success () {
    printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[${FILE_NAME}]" ": " "Successfully done " "$1"
}


# apt install
"${FILE_DIR}/apt_install.sh"


# Rust/Cargo
log_begin "rustup"

curl https://sh.rustup.rs -sSf | sh -s -- -y
# shellcheck source=/dev/null
. "${HOME}/.cargo/env"

log_success "rustup"


# sheldon
log_begin "sheldon"

cargo install sheldon

log_success "sheldon"


# aqua
log_begin "aqua"

mkdir -p "${HOME}/Downloads"
wget -O "${HOME}/Downloads/aqua_linux_amd64.tar.gz" \
"$( \
    curl -s https://api.github.com/repos/aquaproj/aqua/releases/latest \
    | grep "browser_download_url" | grep "aqua_linux_amd64" \
    | cut -d : -f 2,3 \
    | tr -d '\" ' \
)"
tar -zxvf "${HOME}/Downloads/aqua_linux_amd64.tar.gz" -C "${HOME}/Downloads"

mkdir -p "${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin"
mv "${HOME}/Downloads/aqua" "${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin"
ln -fns "${FILE_DIR}/aqua.yaml" "${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/aqua.yaml"

aqua i

log_success "aqua"


# VSCode Extensions
# If `code` command not installed, This flow is skiped.
if command -v code &> /dev/null; then
    log_begin "VSCode"

    "{FILE_DIR}/vscode_install.sh"

    log_success "VSCode"
else
    echo "VSCode is not installed."
    echo "Abort."
fi
