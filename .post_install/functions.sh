function create_symlink_in_dot_config() {
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

function get_dot_files {
    local config_choice="$1"

    a_dot_files=(
        "awesome/rc.lua"
        )

    h_dot_files=(
        "waybar/config" 
        "waybar/style.css"
        "hypr/hyprland.conf"
        "hypr/hyprpaper.conf"
        )
    base_dot_files=(
        "alacritty/alacritty.yml"
        "rofi/config.rasi"
    )

    case $config_choice in
    a)
        local dot_files=${a_dot_files[@]}
        ;;
    h)
        local dot_files=${h_dot_files[@]}
        ;;
    n)
        local dot_files=()
        ;;
    *)
        echo "Invalid choice. Please enter 'a', 'h' or 'n'."
        exit 1
        ;;
    esac

    all_dotfiles=("${base_dot_files[@]}" "${dot_files[@]}")
    echo "${all_dotfiles[@]}"
}

function get_packages {
    local config_choice="$1"
    path=".post_install/"
    file_name="pacman"

    packages=($(cat "$path$file_name.txt"))

    if [[ "$config_choice" == "a" || "$config_choice" == "h" ]]; then
        packages+=($(cat "$path${file_name}_$config_choice.txt"))
    fi

    echo "${packages[@]}"
}
