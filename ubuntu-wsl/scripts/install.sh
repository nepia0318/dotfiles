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

if command -v rustup &> /dev/null; then
    # Update rustup
    rustup update
else
    #Install rustup
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    # shellcheck source=/dev/null
    . "${HOME}/.cargo/env"
fi

log_success "rustup"


# sheldon
log_begin "sheldon"

cargo install sheldon
eval "$(sheldon source)"

log_success "sheldon"


# aqua
log_begin "aqua"

if command -v aqua &> /dev/null; then
    # Update aqua
    aqua -c "${AQUA_GLOBAL_CONFIG}" up
else
    # Install aqua
    AQUA_TEMP="${HOME}/Downloads/aqua_temp"
    mkdir -p "${AQUA_TEMP}"
    wget -O "${AQUA_TEMP}/aqua_linux_amd64.tar.gz" \
    "$( \
        curl -s https://api.github.com/repos/aquaproj/aqua/releases/latest \
        | grep "browser_download_url" | grep "aqua_linux_amd64" \
        | cut -d : -f 2,3 \
        | tr -d '\" ' \
    )"
    tar -zxvf "${AQUA_TEMP}/aqua_linux_amd64.tar.gz" -C "${AQUA_TEMP}"

    mkdir -p "${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin"
    mv "${AQUA_TEMP}/aqua" "${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin"
    ln -fns "${FILE_DIR}/aqua.yaml" "${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/aqua.yaml"
    rm -rf "${AQUA_TEMP}"

    aqua install -a
fi

log_success "aqua"

# fast-syntax-hilighting
fast-theme zdharma

# VSCode Extensions
# If `code` command not installed, This flow is skiped.
if command -v code &> /dev/null; then
    log_begin "VSCode"

    "${FILE_DIR}/vscode_install.sh"

    log_success "VSCode"
else
    echo "VSCode is not installed."
    echo "Abort."
fi
