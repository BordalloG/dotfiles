source .setup/helper.sh

CONFIG=$HOME/.config
DOTFILES=$HOME/dotfiles

function create_symlink {
  src=$1
  dest=$2

  dest_path=$(dirname "$2")
  
  if [ ! -e "$dest_path" ]; then
    echo "Destination folder ${POWDER_BLUE}$dest ${NORMAL}does not exist: ... ${BLINK} Creating ${NORMAL}..."
    mkdir -p $dest_path
  fi

  symlink $src $dest
  check_symlink $dest
}

function symlink {
  src=$1
  dest=$2

  if [ -e "$dest" ]; then
    echo "File ${POWDER_BLUE}$dest ${NORMAL}already exists: ... ${BLINK} Removing ${NORMAL}..."
    rm -f ~/$dest
  fi

  printf "Creating a symlink for $(basename "$src")
    ${POWDER_BLUE}src:${NORMAL} $src
    ${POWDER_BLUE}dest:${NORMAL} $dest \n"
  ln -sf $src $dest
}

function check_symlink {
  dest=$1

  if [ -e "$dest" ]; then
    printf "Symlink${GREEN} successfully${NORMAL} created \n"
  else
    printf "Symlink${RED} failed${NORMAL} to create \n"
  fi
}