# load last

. $HOME/.cargo/env
fpath=($HOME/GitHub/zsh-completions/src $fpath)

source /home/yuki/GitHub/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/GitHub/fzf/.fzf.zsh ] && source ~/GitHub/fzf/.fzf.zsh

eval "$(zoxide init zsh)"
eval "$(sheldon source)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
