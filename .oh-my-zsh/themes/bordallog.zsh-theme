LIGHTARROW="%B%F{#E8A2AF}"
DARKARROW="%B%F{#bd93f9}"
FOLDER="%F{#bd93f9} [%{$fg[white]%}%c% %F{#bd93f9}]"

PROMPT="$LIGHTARROW$DARKARROW$LIGHTARROW $FOLDER"
PROMPT+='$(git_prompt_info)%B 󰁔 %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %B%F{#bd93f9} [%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%B%F{#bd93f9}]%{$reset_color%}"
