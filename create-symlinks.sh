CONFIG_DIR=$HOME/.config
DOTFILES_DIR=$HOME/dotfiles

function create_dirs() {
  dir_path=$(dirname "$1")
  file_name=$(basename "$1")

  # Create directories if they don't exist
  if [ ! -d "$CONFIG_DIR/$dir_path" ]; then
    echo "Creating directories for $CONFIG_DIR/$dir_path..."
    mkdir -p "$CONFIG_DIR/$dir_path"
  fi

  # Create symlink
  ln -sf $DOTFILES_DIR/$dir_path/$file_name $CONFIG_DIR/$dir_path/$file_name
}

create_dirs waybar/config
create_dirs waybar/style.css

create_dirs hypr/hyprland.conf
create_dirs hypr/hyprpaper.conf

create_dirs alacritty/alacritty.yml