export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  zoxide
  zsh-autosuggestions 
  zsh-syntax-highlighting 
  fast-syntax-highlighting 
  kube-ps1
)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

source ~/scripts/aliases.zsh
source ~/scripts/exports.zsh

PROMPT='$(kube_ps1)'$PROMPT
kubeoff
. "/Users/lucas/.acme.sh/acme.sh.env"
