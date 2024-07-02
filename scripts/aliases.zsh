alias vim="nvim"
alias nv="nvim"
alias wrk="cd ~/wrk/"
alias c="clear"
alias ls="eza --icons "
alias x=exit
alias ff=". ranger && nvim ."
alias woman='vim +"Telescope man_pages sections=1,2,3,4,5,6,7,8,9"'
alias tma="tmux attach-session -t"
alias tml="tmux list-sessions"
alias tmn="tmux new-session -s"
if command -v zoxide &> /dev/null; then
  alias cd="z"
fi

function init_latex(){
  if [[ -z $1 ]]; then
    echo "Please provide a directory to initialize"
    return
  fi
  if [[  $1 != "." ]]; then
    mkdir -p $1
  fi
  cp -r ~/dotfiles/latex/* $1
}
