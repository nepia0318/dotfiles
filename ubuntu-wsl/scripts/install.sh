#!/bin/bash

set -eu

# Library/App info
_FILE_DIR="$(cd "$(dirname "$0")"; pwd)"
readonly FILE_DIR=${_FILE_DIR}


# build-essential
printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[install]" ": " "Begin " "build-essential"
sudo apt-get install -y build-essential
printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[install]" ": " "Successfully done " "build-essential"


# wget
printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[install]" ": " "Begin " "wget"

sudo apt-get install -y wget

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[install]" ": " "Successfully done " "wget"


# jq
printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[install]" ": " "Begin " "jq"

sudo apt-get install -y jq

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[install]" ": " "Successfully done " "jq"


# golang
printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[install]" ": " "Begin " "Go / golang-go"

sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt-get install -y golang-go

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[install]" ": " "Successfully done " "Go / golang-go"


# Java
printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[install]" ": " "Begin " "Java / default-jdk"

sudo apt-get install -y default-jdk

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[install]" ": " "Successfully done " "Java / default-jdk"


# aqua
printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[install]" ": " "Begin " "aqua"

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

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[install]" ": " "Successfully done " "aqua"


# wslu
printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[install]" ": " "Begin " "wslu"

sudo add-apt-repository ppa:wslutilities/wslu
sudo apt update
sudo apt install wslu

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[install]" ": " "Successfully done " "wslu"


# Rust/Cargo
printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[install]" ": " "Begin " "Rust / Cargo"

curl https://sh.rustup.rs -sSf | sh -s -- -y

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[install]" ": " "Successfully done " "Rust / Cargo"


# sheldon
printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[install]" ": " "Begin " "sheldon"

cargo install sheldon

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[install]" ": " "Successfully done " "sheldon"
