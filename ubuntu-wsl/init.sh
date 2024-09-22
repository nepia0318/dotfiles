#!/bin/bash

set -eu

_FILE_DIR=$(cd "$(dirname "$0")" || exit; pwd)
readonly FILE_DIR=${_FILE_DIR}
# readonly FILE_DIR_BASE=$(basename ${FILE_DIR})
printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[init]" ": " "Begin " "init.sh"

# zsh
printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[init]" ": " "Begin " "zsh initialization"

sudo apt-get install -y zsh
sudo chsh "${USER}" -s "$(which zsh)"
echo "zsh-path: $(which zsh)"
"${FILE_DIR}/zsh/symlink_init.sh"

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[init]" ": " "Successfully done " "zsh initialization"

# on_zsh
zsh "${FILE_DIR}/scripts/on_zsh.sh"

# end

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[init]" ": " "Successfully done " "init.sh"
