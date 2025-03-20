brew install zoxide stow kitty \
  tmux ripgrep fzf curl git python3 \
  golang nodejs npm  ninja gettext unzip pkg-config \
  autoconf automake libtool make cmake

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#clone neovim
#git clone https://github.com/neovim/neovim.git
#cd neovim
#make CMAKE_BUILD_TYPE=Debug -j4
#sudo make install
#cd ..
#rm -rf neovim

#chsh -s $(which zsh)

#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#cargo install exa ripgrep zoxide

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

