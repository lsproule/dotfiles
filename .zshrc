
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"
source ~/scripts/aliases.zsh
source ~/scripts/exports.zsh
source ~/scripts/theme.zsh

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light vim/vim
zinit light jonmosco/kube-ps1

zinit ice as'null' from"gh-r" sbin

zi has'zoxide' wait lucid for atload="function z() { __zoxide_z \"\$@\" }" \
  z-shell/zsh-zoxide

autoload -Uz compinit && compinit

