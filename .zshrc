export ZSH="$HOME/.oh-my-zsh"
export PATH=/home/bordallog/.local/bin:$PATH

. /opt/asdf-vm/asdf.sh

ZSH_THEME="bordallog"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias vpns="nordvpn status"
alias vpnc="nordvpn connect Brazil"
alias vpnd="nordvpn disconnect"
alias vpncc="nordvpn connect"
alias meshon="nordvpn set meshnet on"
alias meshof="nordvpn set meshnet off" 
alias meshlist="nordvpn meshnet peer list"

alias dotfiles="cd ~/dotfiles"
alias wks="cd ~/wks"
alias ggt="cd ~/wks/ggt"

alias gs="git status"

