source .setup/pacman.sh
source .setup/symlinks.sh

#check if this file is in $HOME/dotfiles    
if [[ ! $(pwd) == "$HOME/dotfiles" ]]; then
    echo "Please move the dotfiles folder to $HOME/dotfiles"
    exit 1
fi

echo "installing packages"
update
install ${packages[@]}
install_yay 
install_from_aur${aur_packages[@]}

echo "creating symlinks"
create_symlink $CONFIG alacritty/alacritty.yml
create_symlink $HOME .zshrc
create_symlink $HOME .oh-my-zsh/themes/bordallog.zsh-theme