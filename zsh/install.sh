source .setup/symlinks.sh

function install_oh_my_zsh {
    if [[ -d "$HOME/.oh-my-zsh" ]]; then
        echo "oh-my-zsh is already installed"
        return
    fi

    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

yay -S --noconfirm --needed zsh

install_oh_my_zsh
create_symlink zsh/.zshrc $HOME
create_symlink zsh/.oh-my-zsh/themes/bordallog.zsh-theme $HOME/.oh-my-zsh/themes

printf "Installing zsh plugins \n"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting