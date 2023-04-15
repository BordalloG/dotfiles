# Default OMZ theme for Archcraft
purple=bd93f9


PROMPT=""
PROMPT+="%B%F{#E8A2AF}"
PROMPT+="%B%F{#bd93f9}"
PROMPT+="%B%F{#E8A2AF}"


PROMPT+='%B%F{#bd93f9}  $fg_bold[white]%c%{$reset_color%} $(git_prompt_info)%B󰁔 '


ZSH_THEME_GIT_PROMPT_PREFIX=" " 

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{#bd93f9} [%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%B%F{#bd93f9}]%{$reset_color%} "
