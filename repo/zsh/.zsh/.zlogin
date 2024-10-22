# load last

# enable completion
autoload -Uz compinit && compinit -i
autoload -Uz colors; colors

. $HOME/.cargo/env
[ -f ~/GitHub/fzf/.fzf.zsh ] && source ~/GitHub/fzf/.fzf.zsh

source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(sheldon source)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
