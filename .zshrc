export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

ZSH_DISABLE_COMPFIX="true"


source $ZSH/oh-my-zsh.sh

KUBE_PS1_SYMBOL_USE_IMG=false
KUBE_PS1_SYMBOL_ENABLE=false

plugins=(
  git 
  zsh-syntax-highlighting 
  zsh-autosuggestions
  fast-syntax-highlighting 
  zsh-completions
  zoxide
  kubectl
  tmux
)
source $ZSH/oh-my-zsh.sh

source ~/venv/bin/activate
setxkbmap -option caps:escape

# autoload -Uz compinit && compinit -C
#[[ $commands[kubectl] ]] && source <(rustup completions zsh)
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
[[ $commands[kubectl] ]] && source <(helm completion zsh)

unsetopt BEEP
source ~/scripts/aliases.zsh
source ~/scripts/exports.zsh

# bun completions
[ -s "/home/lucas/.bun/_bun" ] && source "/home/lucas/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"