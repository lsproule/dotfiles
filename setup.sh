ln -s $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/tmux/.tmux.conf $HOME/.tmux.conf

mkdir -p $HOME/.config
ln -s $HOME/dotfiles/neovim $HOME/.config/nvim
ln -s $HOME/dotfiles/rofi $HOME/.config/rofi
ln -s $HOME/dotfiles/ranger $HOME/.config/ranger
ln -s $HOME/dotfiles/sxhkd $HOME/.config/sxhkd
ln -s $HOME/dotfiles/bspwm $HOME/.config/bspwm
ln -s $HOME/dotfiles/polybar $HOME/.config/polybar
ln -s $HOME/dotfiles/picom $HOME/.config/picom
