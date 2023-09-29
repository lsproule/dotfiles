sudo apt install -y bspwm i3 zoxide kitty picom polybar ranger rofi sxhkd zsh \
  tmux xclip exa ripgrep fzf curl git python3 python3-pip python3-venv \
  golang nodejs npm  ninja-build gettext cmake unzip pkg-config \
  build-essential libtool-bin autoconf automake libxcb-xfixes0-dev \
  g++ libtool-bin libtool libtool-doc libtoolize libtool-ltdl-dev \
  gcc make cmake zsh 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#clone neovim
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Debug -j4
sudo make install
cd ..
rm -rf neovim
chsh -s $(which zsh)
curl -O https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
echo "set your font in terminal to JetBrainsMono Nerd Font"
unzip JetBrainsMono.zip -d ~/.local/share/fonts
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

