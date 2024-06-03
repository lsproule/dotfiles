autoload -Uz add-zsh-hook

setopt prompt_subst

function parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "$fg[blue]) %{$fg[yellow]%}%G✗$reset_color "
}





setup_prompt() {


  PROMPT="%(?:%{$fg_bold[green]%}%1{%G➜%} :%{$fg_bold[red]%}%1{%G➜%} ) %{$fg[cyan]%}%c%{$reset_color%} $reset_color"

  ref=$(git symbolic-ref HEAD 2&> /dev/null) || return

  #kubectl get pod 2&> /dev/null
  if [ $? -eq 0 ]; then
    kubeon
  fi
  git rev-parse --is-inside-work-tree &> /dev/null || return 

  PROMPT="$PROMPT $fg[blue]git(%{$fg_bold[red]%}${ref#refs/heads/}$(parse_git_dirty) $reset_color"
}





PROMPT="%(?:%{$fg_bold[green]%}%1{%G➜%} :%{$fg_bold[red]%}%1{%G➜%} ) %{$fg[cyan]%}%c%{$reset_color%} $reset_color"
#chpwd_functions+=(git_prompt_info_func)
precmd_functions+=(setup_prompt)
#git_prompt_info_func





ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}$reset_color"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

