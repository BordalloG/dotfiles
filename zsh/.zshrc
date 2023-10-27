export ZSH="$HOME/.oh-my-zsh"
export PATH=$HOME/.local/bin:$PATH

. /opt/asdf-vm/asdf.sh

ZSH_THEME="bordallog"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias dotfiles="cd ~/dotfiles"
alias wks="cd ~/wks"
alias ggt="cd ~/wks/ggt"

alias gs="git status"

