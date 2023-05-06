CONFIG=$HOME/.config
DOTFILES=$HOME/dotfiles

function create_symlink {
  dest_path=$1
  file_path=$(dirname "$2")
  file_name=$(basename "$2")
  dest=$dest_path/$file_path

  if [ $file_path == "." ]; then
    dest=$dest_path
  fi

  if [ ! -e "$dest" ]; then
    echo "Destination does not exist: $dest"
    echo "Creating ..."
    mkdir -p $dest
  fi

  symlink $DOTFILES/$2 $dest/$file_name
}

function symlink {
  src=$1
  dest=$2

  if [ -e "$dest" ]; then
    rm -f ~/$dest
  fi

  echo "[symlink - $(basename "$src")] [src: $src] <- [dest: $dest)]"
  ln -sf $src $dest
}