CONFIG=$HOME/.config
DOTFILES=$HOME/dotfiles

function create_symlink {
  dest_path=$1
  file_path=$(dirname "$2")
  file_name=$(basename "$2")

  #check if folder structure exists
  if [ ! -e "$file_path" ]; then
    echo "Destination does not exist: $file_path"
    echo "Creating ..."
    mkdir -p $(dirname "$file_path")
  fi

  if [ $file_path == "." ]; then
    symlink $DOTFILES/$2 $dest_path/$file_name
    return
  fi

  symlink $DOTFILES/$2 $dest_path/$file_path/$file_name
}

function symlink {
  src=$1
  dest=$2

  if [ -e "$dest" ]; then
    rm -f ~/$dest
  fi

  echo "[symlink - $(basename "$src") ] src:$(dirname "$src") <- dest:$(dirname "$dest")"
  ln -sf $src $dest
}