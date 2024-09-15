#!/bin/zsh

readonly FILE_DIR=$(cd $(dirname $0); pwd)
readonly FILE_DIR_BASE=$(basename ${FILE_DIR})
printf "\033[32m%s\033[m%s\033[93m%s\033[m%s\n" "[init]" ": " "Begin " "init.sh"

# Do symlink.sh
find "${FILE_DIR}" -type f -name 'symlink.sh' -print0 | while IFS= read -r -d '' file; do
    basename=$(basename "$file")
    zsh $file
done
