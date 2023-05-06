function install_oh_my_zsh {
    if [[ -d "$HOME/.oh-my-zsh" ]]; then
        return
    fi

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}