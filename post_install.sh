source .post_install/functions.sh

CONFIG_DIR=$HOME/.config
DOTFILES_DIR=$HOME/dotfiles

echo "Which configuration do you want to use: awesome(Xorg) or hyprland(Sway)?"
read -p "Enter 'a' for awesome, 'h' for hyprland, or 'n' for none: " config_choice

dotfiles=($(get_dot_files $config_choice))
# packages=($(get_packages $config_choice))
packages=$(get_packages $config_choice)

read -r -p "Do you want to download packages listed in pacman.txt? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  sudo pacman -S --noconfirm ${packages[@]}
fi

read -r -p "Do you want to create symlinks? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  for file in "${dotfiles[@]}"
  do
    create_symlink_in_dot_config "$file"
  done
fi


# create_in_home .oh-my-zsh/themes/bordallog.zsh-theme
# create_in_home .zshrc