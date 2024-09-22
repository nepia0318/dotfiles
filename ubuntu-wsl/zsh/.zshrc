# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
echo "test1"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#################################  HISTORY  #################################
# history
HISTFILE=$HOME/.zsh_history     # 履歴を保存するファイル
HISTSIZE=100000                 # メモリ上に保存する履歴のサイズ
SAVEHIST=1000000                # 上述のファイルに保存する履歴のサイズ

# share .zshhistory
setopt inc_append_history       # 実行時に履歴をファイルにに追加していく
setopt share_history            # 履歴を他のシェルとリアルタイム共有する

setopt hist_ignore_all_dups     # ヒストリーに重複を表示しない
setopt hist_save_no_dups        # 重複するコマンドが保存されるとき、古い方を削除する。
setopt extended_history         # コマンドのタイムスタンプをHISTFILEに記録する
setopt hist_expire_dups_first   # HISTFILEのサイズがHISTSIZEを超える場合は、最初に重複を削除します


# enable completion
autoload -Uz compinit; compinit

autoload -Uz colors; colors

# Tabで選択できるように
zstyle ':completion:*:default' menu select=2

# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# カッコを自動補完
setopt auto_param_keys

# ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt mark_dirs

# 補完キー連打で順に補完候補を自動で補完
setopt auto_menu

# スペルミス訂正
setopt correct

# コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# 語の途中でもカーソル位置で補完
setopt complete_in_word

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# ディレクトリ名だけでcdする
setopt auto_cd

# ビープ音を消す
# setopt no_beep

# コマンドを途中まで入力後、historyから絞り込み
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

. $HOME/.cargo/env
fpath=($HOME/GitHub/zsh-completions/src $fpath)

# lsコマンドのalias関連
alias ls='ls --color=auto -G'
alias la='ls -lAG'
alias ll='ls -lG'
alias l='ls -LAHG'

# clearコマンドのalias関連
alias c='clear'
alias cc='c &&'

alias ..='cd ..'
alias ...='cd ../..'

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias open='wsl-open'
alias fzfv="fzf --preview 'fzf-preview.sh {}'"
alias fzff="fzf --height 40% --layout reverse --info inline --border \
    --preview 'file {}' --preview-window up,1,border-horizontal \
    --bind 'ctrl-/:change-preview-window(50%|hidden|)' \
    --color 'fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899'"

function gi() { curl -sLw \"\\\n\" "https://www.toptal.com/developers/gitignore/api/$@" ;}

export EDITOR=nvim
export MANPATH="/usr/local/texlive/2021/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2021/texmf-dist/doc/info:$INFOPATH"
export CMAKE_PREFIX_PATH="/home/yuki/GitHub/opengv/build:$CMAKE_PREFIX_PATH"
export FZF_DEFAULT_COMMAND='fd --type file --color=always'
export FZF_DEFAULT_OPTS='--ansi'
export FLYCTL_INSTALL="/home/yuki/.fly"
export ENHANCD_COMMAND=ecd

export PATH="$PATH:$HOME/.local/bin"
export PATH="/usr/local/texlive/2021/bin/x86_64-linux:$PATH"
export PATH="/usr/local/cuda-12.2/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:$FLYCTL_INSTALL/bin"

export PATH="/usr/lib/jvm/graalvm-jdk-21.0.4+8.1/bin:$PATH"

export PATH="$PATH:/mnt/c/Users/widef/AppData/Local/Programs/Microsoft VS Code/bin"

echo "test2"
source /home/yuki/GitHub/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/GitHub/fzf/.fzf.zsh ] && source ~/GitHub/fzf/.fzf.zsh

echo "test3"
eval "$(zoxide init zsh)"
echo "test4"
eval "$(sheldon source)"

echo "test5"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
