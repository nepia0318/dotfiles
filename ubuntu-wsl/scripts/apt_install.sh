#!/bin/bash

set -eu

# Info
_FILE_NAME="$(basename "$0")"
readonly FILE_NAME=${_FILE_NAME}

log_begin () {
    printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[${FILE_NAME}]" ": " "Begin " "$1"
}

log_success () {
    printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[${FILE_NAME}]" ": " "Successfully done " "$1"
}


log_begin "apt_install"


# Add apt repository
log_begin "apt update"

sudo add-apt-repository -y ppa:longsleep/golang-backports
sudo add-apt-repository -y ppa:wslutilities/wslu

# Node.js/npm
log_begin "nodejs setup"

if command -v nodejs &> /dev/null; then
    # Update nodejs
    npm update
    # Update apt separatory
    sudo apt update
else
    #Add nodejs PPA (`apt update` run in this script)
    curl -fsSL https://deb.nodesource.com/setup_22.x | sh -s -- -y

fi

log_success "nodejs setup"

log_success "apt update"


# apt install
TARGET_PACKAGES=(
    "build-essential" "libssl-dev" "wget" "jq" "xsel" "golang-go" "default-jdk" "wslu" "nodejs"
)

for pkg in "${TARGET_PACKAGES[@]}"
do
    log_begin "${pkg}"
    sudo apt-get install -y "${pkg}"
    log_success "${pkg}"
done


log_success "apt_install"
