sudo pacman -S --noconfirm base-devel stow bspwm i3 zoxide kitty \
  picom polybar ranger rofi sxhkd zsh gcc make cmake\
  tmux xclip exa ripgrep fzf curl git python python-pip python-venv \
  golang nodejs npm  ninja gettext cmake unzip pkg-config \
  autoconf automake 

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#clone neovim
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Debug -j4
sudo make install
cd ..
rm -rf neovim

chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0



