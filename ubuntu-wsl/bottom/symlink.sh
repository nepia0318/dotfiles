#!/bin/bash

set -eu

# Library/App info
_FILE_DIR="$(cd "$(dirname "$0")"; pwd)"
readonly FILE_DIR=${_FILE_DIR}
_FILE_DIR_BASE="$(basename "$FILE_DIR")"
readonly FILE_DIR_BASE=${_FILE_DIR_BASE}
# printf "\033[32m%s\033[93m%s\033[m%s\n" "[symlink]" "begin" ": ${FILE_DIR_BASE}"

# target base
TARGET_BASE="${HOME}/temp/symlink_test"
EXCEPT_FILES=("$(basename "$0")")

find "$FILE_DIR" -type f -name '???*' -print0 | while IFS= read -r -d '' file; do
    basename="$(basename "$file")"
    for except_file in "${EXCEPT_FILES[@]}"; do
        if [[ $basename == "$except_file" ]]; then
            continue 2
        fi
    done

    rel_path=${file#"${FILE_DIR}"/}
    target_dir="${TARGET_BASE}/$(dirname "$rel_path")"
    mkdir -p "$target_dir"

    if [ -e "${TARGET_BASE}/${rel_path}" ]; then
        cp "${TARGET_BASE}/${rel_path}" "${TARGET_BASE}/${rel_path}_buckup"
    fi

    ln -fns "$file" "${TARGET_BASE}/${rel_path}"
done

# sucess
printf "\033[32m%s\033[m%s\033[96m%s\033[m%s\n" "[symlink]" ": " "Successfully done " "${FILE_DIR_BASE}"
