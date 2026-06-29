#zmodload zsh/zprof

export ZSH_DISABLE_COMPFIX=true
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  zoxide
  zsh-autosuggestions 
  zsh-syntax-highlighting 
  fast-syntax-highlighting 
  kube-ps1
  zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# Restore emacs keys inside vi insert mode (zsh-vi-mode wipes them on init)
function zvm_after_init() {
  bindkey -M viins '^A' beginning-of-line
  bindkey -M viins '^E' end-of-line
  bindkey -M viins '^K' kill-line
  bindkey -M viins '^U' backward-kill-line
  bindkey -M viins '^W' backward-kill-word
  bindkey -M viins '^Y' yank
  bindkey -M viins '^F' forward-char
  bindkey -M viins '^B' backward-char
  bindkey -M viins '^N' down-line-or-history
  bindkey -M viins '^P' up-line-or-history
  bindkey -M viins '^R' history-incremental-search-backward
  bindkey -M viins '^D' delete-char-or-list
  autoload -Uz edit-command-line
  zle -N edit-command-line
  bindkey -M viins '^X^E' edit-command-line
  bindkey -M vicmd '^X^E' edit-command-line
}

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

source ~/scripts/aliases.zsh
source ~/scripts/exports.zsh
source ~/scripts/exports.zsh
source ~/scripts/termconfig.zsh

WORK=true

if [[ $WORK == true ]]; then
  source ~/scripts/vokol.zsh
fi

PROMPT='$(kube_ps1)'$PROMPT
kubeoff
path=("$HOME/go/bin" $path)
path=("$HOME/.local/bin" $path)
export PATH

source <(tea completion zsh)
#zprof

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/lucas/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
export TERM=xterm-256color

# bun completions
[ -s "/home/lucas/.bun/_bun" ] && source "/home/lucas/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/nomad-pack nomad-pack
eval "$(~/.local/bin/mise activate zsh)"
