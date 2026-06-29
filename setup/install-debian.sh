#!/usr/bin/env bash
#
# Fresh-Debian bootstrap. Idempotent — safe to re-run.
#
#   git clone <dotfiles> ~/dotfiles && cd ~/dotfiles && ./setup/install-debian.sh
#
# Installs: sway + wayland stack, DankMaterialShell (dms), neovim (from source),
# zsh + oh-my-zsh + plugins, rust, asdf, personal nvim plugins, then stows.
# Targets Debian 13 (Trixie)+ where dms is available.
set -euo pipefail

# --- privilege helper: prefer doas, fall back to sudo --------------------
if command -v doas >/dev/null 2>&1; then
  SU=doas
else
  SU=sudo
fi

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"
PLUGINS_DIR="$HOME/plugins"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

log() { printf '\n\033[1;32m==> %s\033[0m\n' "$*"; }

# --- system packages -----------------------------------------------------
log "Installing apt packages"
$SU apt update
$SU apt install -y \
  stow zsh tmux git curl xclip ripgrep fzf zoxide ranger \
  sway swaybg swayidle swaylock wl-clipboard grim slurp \
  brightnessctl playerctl network-manager-gnome gnome-keyring feh \
  kitty alacritty \
  xdg-desktop-portal xdg-desktop-portal-wlr \
  python3 python3-pip python3-venv golang nodejs npm \
  ninja-build gettext cmake unzip pkg-config build-essential \
  libtool libtool-bin autoconf automake g++ gcc make \
  bspwm i3 picom polybar sxhkd rofi libxcb-xfixes0-dev

# --- DankMaterialShell (dms) ---------------------------------------------
# Bar / launcher / clipboard / audio OSD — replaces waybar + wofi.
# The installer pulls the dms binary and Debian deps. Compositor auto-config
# is niri/Hyprland only; we drive dms from our own sway config instead.
if ! command -v dms >/dev/null 2>&1; then
  log "Installing DankMaterialShell (dms)"
  curl -fsSL https://install.danklinux.com | sh
else
  log "dms already installed — skipping"
fi

# --- neovim from source --------------------------------------------------
# Release build (not Debug — Debug nvim is markedly slower), all cores,
# shallow clone of the stable tag instead of the full unstable HEAD history.
if ! command -v nvim >/dev/null 2>&1; then
  log "Building neovim from source (stable, Release)"
  tmp="$(mktemp -d)"
  git clone --depth 1 --branch stable https://github.com/neovim/neovim.git "$tmp/neovim"
  make -C "$tmp/neovim" CMAKE_BUILD_TYPE=Release "-j$(nproc)"
  $SU make -C "$tmp/neovim" install
  rm -rf "$tmp"
else
  log "neovim already installed — skipping"
fi

# --- rust ----------------------------------------------------------------
if ! command -v rustc >/dev/null 2>&1; then
  log "Installing rust"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

# --- zsh + oh-my-zsh -----------------------------------------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  log "Installing oh-my-zsh"
  RUNZSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

log "Installing zsh plugins"
clone_plugin() { # $1=url $2=dest-name
  local dest="$ZSH_CUSTOM/plugins/$2"
  [ -d "$dest" ] || git clone --depth 1 "$1" "$dest"
}
clone_plugin https://github.com/zsh-users/zsh-autosuggestions.git        zsh-autosuggestions
clone_plugin https://github.com/zsh-users/zsh-syntax-highlighting.git     zsh-syntax-highlighting
clone_plugin https://github.com/zdharma-continuum/fast-syntax-highlighting.git fast-syntax-highlighting
clone_plugin https://github.com/jeffreytse/zsh-vi-mode.git               zsh-vi-mode
clone_plugin https://github.com/jonmosco/kube-ps1.git                    kube-ps1

# --- asdf ----------------------------------------------------------------
if [ ! -d "$HOME/.asdf" ]; then
  log "Installing asdf"
  git clone --depth 1 https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
fi

# --- personal neovim plugins (referenced by lua/plugins/my_plugins.lua) --
log "Cloning personal neovim plugins into $PLUGINS_DIR"
mkdir -p "$PLUGINS_DIR"
clone_mine() { # $1=repo-name
  [ -d "$PLUGINS_DIR/$1" ] || git clone "https://github.com/lsproule/$1.git" "$PLUGINS_DIR/$1"
}
clone_mine git_lines
clone_mine lsps-manager
clone_mine reg-edit

# --- default shell -------------------------------------------------------
if [ "$(basename "${SHELL:-}")" != "zsh" ]; then
  log "Setting zsh as default shell"
  chsh -s "$(command -v zsh)" || true
fi

# --- stow dotfiles -------------------------------------------------------
log "Stowing dotfiles"
(cd "$DOTFILES" && stow .)

log "Done. Log out/in (or 'exec zsh') and start sway."
