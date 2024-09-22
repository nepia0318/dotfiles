#!/bin/bash

readonly FILE_DIR=$(cd $(dirname $0); pwd)
readonly FILE_DIR_BASE=$(basename ${FILE_DIR})
printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[init]" ": " "Begin " "init.sh"

# zsh
sudo apt install zsh
chsh -s /bin/bash
${FILE_DIR}/zsh/symlink_init.sh

# install.sh
${FILE_DIR}/scripts/install.sh

# symlink.sh
find "${FILE_DIR}" -type f -name 'symlink.sh' -print0 | while IFS= read -r -d '' file; do
    basename=$(basename "$file")
    if 
    zsh $file
done
