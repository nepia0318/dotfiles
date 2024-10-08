# Setting XDG Base Directory
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# Valiable Settings
export EDITOR=nvim
export AQUA_GLOBAL_CONFIG="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/aqua.yaml"
export AQUA_PROGRESS_BAR=true
export FZF_DEFAULT_COMMAND='fd --type file --color=always'
export FZF_DEFAULT_OPTS='--ansi'
export FLYCTL_INSTALL="${HOME}/.fly"

# PATH Settings
export PATH="${PATH}:${HOME}/.local/bin"
export PATH="${PATH}:/opt/nvim-linux64/bin"
export PATH="${PATH}:${FLYCTL_INSTALL}/bin"
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:${PATH}"

export PATH="/usr/lib/jvm/graalvm-jdk-21.0.4+8.1/bin:${PATH}"

export PATH="${PATH}:${VSCODE_PATH}"
