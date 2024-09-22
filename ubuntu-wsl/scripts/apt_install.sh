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

sudo add-apt-repository ppa:longsleep/golang-backports
sudo add-apt-repository ppa:wslutilities/wslu
sudo apt update

log_success "apt update"


# apt install
TARGET_PACKAGES=("build-essential" "wget" "jq" "golang-go" "default-jdk" "wslu")

for pkg in "${TARGET_PACKAGES[@]}"
do
    log_begin "${pkg}"
    sudo apt-get install -y "${pkg}"
    log_success "${pkg}"
done


log_success "apt_install"