#!/bin/bash

set -eu

sudo apt-get install -y build-essential
printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[install]" ": " "Successfully done " "build-essential"
sudo apt-get install -y wget
printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[install]" ": " "Successfully done " "wget"

# golang
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt-get install -y golang-go
printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[install]" ": " "Successfully done " "Go / golang-go"

# Java
sudo apt-get install -y default-jdk
printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[install]" ": " "Successfully done " "Java / default-jdk"

# aqua
mkdir -p "${HOME}/Downloads"
aqua_url="$( \
    curl -s https://api.github.com/repos/aquaproj/aqua/releases/latest \
    | grep "browser_download_url" | grep "aqua_linux_amd64" \
    | cut -d : -f 2,3 \
    | tr -d \" \
)"

wget -O "${HOME}/Downloads/aqua_linux_amd64.tar.gz" "${aqua_url}"
tar -zxvf "${HOME}/Downloads/aqua_linux_amd64.tar.gz"

mkdir -p "${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin"
mv "$HOME"/Downloads/aqua "${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin"

aqua i

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[install]" ": " "Successfully done " "aqua"

# wslu
sudo apt-get install -y gnupg2 apt-transport-https
wget -O - https://pkg.wslutiliti.es/public.key | sudo gpg -o /usr/share/keyrings/wslu-archive-keyring.pgp --dearmor
# shellcheck source=/dev/null
echo "deb [signed-by=/usr/share/keyrings/wslu-archive-keyring.pgp] https://pkg.wslutiliti.es/debian \
$(. /etc/os-release && echo "$VERSION_CODENAME") main" | sudo tee /etc/apt/sources.list.d/wslu.list

sudo apt update
sudo apt install wslu

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[install]" ": " "Successfully done " "wslu"

# Rust/Cargo
curl https://sh.rustup.rs -sSf | sh

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[install]" ": " "Successfully done " "Rust / Cargo"

# sheldon
cargo install sheldon

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[install]" ": " "Successfully done " "sheldon"
