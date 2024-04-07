export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export EDITOR="nvim"
export MODULAR_HOME="$HOME/.modular"
export PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH"
export PATH=$PATH:$HOME/.cargo/bin:$PATH
export LUA=/usr/include/lua5.4
export LUAINC=/usr/include/lua5.4
export LUALIB=/usr/lib/lua/5.4
export LUABIN=/usr/bin
#export PROMPT=$(kube_ps1)$PROMPT

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PATH=$HOME/.asdf/bin:$PATH
source "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)

