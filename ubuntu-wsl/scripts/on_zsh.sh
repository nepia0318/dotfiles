#!/bin/zsh

set -eu

_FILE_DIR=$(cd "$(dirname "$0")" || exit; pwd)
readonly FILE_DIR=${_FILE_DIR}
# readonly FILE_DIR_BASE=$(basename ${FILE_DIR})

# zsh
printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[on_zsh]" ": " "Begin " "on_zsh.sh"

"${FILE_DIR}/../zsh/symlink_init.sh"
# shellcheck source=/dev/null
source "${HOME}/.zsh/.zshenv"

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[on_zsh]" ": " "Successfully done " "source .zshrc"

# install.sh
printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[on_zsh]" ": " "Begin " "install.sh"

"${FILE_DIR}/scripts/install.sh"

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[on_zsh]" ": " "Successfully done " "install.sh"

# symlink.sh
printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[on_zsh]" ": " "Begin " "symlink.sh"

find "${FILE_DIR}" -type f -name 'symlink.sh' -print0 | while IFS= read -r -d '' file; do
    # basename=$(basename "$file")
    "$file"
done

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[on_zsh]" ": " "Successfully done " "symlink.sh"

# shellcheck source=/dev/null
source "${HOME}/.zshrc"

# end

printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[on_zsh]" ": " "Successfully done " "on_zsh.sh"
