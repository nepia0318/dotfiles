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
"${FILE_DIR}/zsh/symlink_init.sh"
# shellcheck source=/dev/null
source "${HOME}/.zshrc"

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[init]" ": " "Successfully done " "zsh initialization"

# install.sh
printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[init]" ": " "Begin " "install.sh"

"${FILE_DIR}/scripts/install.sh"

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[init]" ": " "Successfully done " "install.sh"

# symlink.sh
printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[init]" ": " "Begin " "symlink.sh"

find "${FILE_DIR}" -type f -name 'symlink.sh' -print0 | while IFS= read -r -d '' file; do
    # basename=$(basename "$file")
    "$file"
done

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[init]" ": " "Successfully done " "symlink.sh"

# end
printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[init]" ": " "Successfully done " "init.sh"
