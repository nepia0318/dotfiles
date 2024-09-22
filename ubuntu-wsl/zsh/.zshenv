# Setting XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Valiable Settings
export EDITOR=nvim
export MANPATH="/usr/local/texlive/2021/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2021/texmf-dist/doc/info:$INFOPATH"
export CMAKE_PREFIX_PATH="/home/yuki/GitHub/opengv/build:$CMAKE_PREFIX_PATH"
export FZF_DEFAULT_COMMAND='fd --type file --color=always'
export FZF_DEFAULT_OPTS='--ansi'
export FLYCTL_INSTALL="/home/yuki/.fly"
export ENHANCD_COMMAND=ecd

# PATH Settings
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:$FLYCTL_INSTALL/bin"
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"

export PATH="/usr/lib/jvm/graalvm-jdk-21.0.4+8.1/bin:$PATH"

export PATH="$PATH:/mnt/c/Users/widef/AppData/Local/Programs/Microsoft VS Code/bin"
