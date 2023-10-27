# source .setup/pacman.sh
# source .setup/symlinks.sh
source .setup/helper.sh

# goes over all folders and calle install.sh when present
function install_all {
    for folder in $(ls -da */); do         
        if [[ -f "$folder/install.sh" ]]; then
            prompt_install $folder "$folder/install.sh"                                
        fi
    done
    printf "Done ... Press any key to exit \n"
    read -r answer
    clear
}

install_yay
resp=$?
if [[ $resp -eq 0 ]]; then # only proceed if yay was installed, it is required to install some packages
    clear
    install_all
fi