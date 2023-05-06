function update {
  sudo pacman -Syu --noconfirm
}

function install {
  sudo pacman -S --noconfirm --needed $@
}

function install_yay {
  if yay --version &> /dev/null; then
    return
  fi

  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
}

function install_from_aur {
  yay -S --noconfirm --needed $@
}

packages=(
    "alacritty"
    "zsh"
    "neovim"
    "git"
    "awesome"
    "rofi"
    "base-devel"
)

aur_packages=(
    "ttf-jetbrains-mono-nerd"
)
