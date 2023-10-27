function prompt_install {    
    folder=${folder::-1}
    
    echo -n "Do you want to install $folder? [y/N] "
    read -r answer
    if [[ $answer =~ ^([yY][eE][sS]|[yY])$ ]]; then
        chmod +x "$2"
        eval "$2"
    else
        echo "Skipping $folder"
    fi
}

function install_yay {
  printf "yay is required to continue. Do you want to proceed? [y/N] \n"
  read -r answer  
    if [[ $answer =~ ^([yY][eE][sS]|[yY])$ ]]; then
        if yay --version &> /dev/null; then
            printf "yay is already installed \n"
            return
        fi

        printf "Installing yay \n"
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ..
        rm -rf yay
    else
        return
    fi
}

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)
NORMAL=$(tput sgr0)