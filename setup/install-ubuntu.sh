doas apt install -y bspwm i3 zoxide stow kitty picom polybar ranger rofi sxhkd zsh \
  tmux xclip ripgrep fzf curl git python3 python3-pip python3-venv \
  golang nodejs npm  ninja-build gettext cmake unzip pkg-config \
  build-essential libtool-bin autoconf automake libxcb-xfixes0-dev \
  g++ libtool-bin libtool libtool-doc   \
  gcc make cmake

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#clone neovim
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Debug -j4
doas make install
cd ..
rm -rf neovim

chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting


# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

cargo install exa ripgrep zoxide




