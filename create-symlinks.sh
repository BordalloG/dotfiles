CONFIG_DIR=$HOME/.config
DOTFILES_DIR=$HOME/dotfiles

function create_in_dot_config() {
  dir_path=$(dirname "$1")
  file_name=$(basename "$1")

  # Create directories if they don't exist
  if [ ! -d "$CONFIG_DIR/$dir_path" ]; then
    echo "[mkdir] $CONFIG_DIR/$dir_path..."
    mkdir -p "$CONFIG_DIR/$dir_path"
  fi

  create_symlink $DOTFILES_DIR/$dir_path/$file_name $CONFIG_DIR/$dir_path/$file_name
}

function create_in_home() {
  create_symlink $DOTFILES_DIR/$1 $HOME/$1
}

function create_symlink() {
  if [ -e "$2" ]; then
    rm -f ~/$2
  fi

  echo "[symlink - $(basename "$1") ] $(dirname "$1") <- $(dirname "$2")"

  ln -sf $1 $2
}

create_in_dot_config waybar/config
create_in_dot_config waybar/style.css

create_in_dot_config hypr/hyprland.conf
create_in_dot_config hypr/hyprpaper.conf

create_in_dot_config alacritty/alacritty.yml

create_in_home .oh-my-zsh/themes/bordallog.zsh-theme
create_in_home .zshrc