# .zshrc

# -- Powerlevel9k ----------------------------------------------------------- #

# general
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='\e[1D'
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX='%F{233}%K{233} %K{default} %F{default} '
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(background_jobs context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status nvm_current time)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# background jobs segment
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='232'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='14'

# context segment
DEFAULT_USER="$USER"
POWERLEVEL9K_ALWAYS_SHOW_USER=true
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='118'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='232'
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='196'
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='232'

# dir writable segment
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="015"

# dir segment
POWERLEVEL9K_DIR_HOME_BACKGROUND='233'
POWERLEVEL9K_DIR_HOME_FOREGROUND='75'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='233'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='75'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='233'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='75'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_SHORTEN_STRATEGY="none"
POWERLEVEL9K_HOME_ICON=' '
POWERLEVEL9K_HOME_SUB_ICON=' '
POWERLEVEL9K_FOLDER_ICON=' '

# vcs git segment
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='118'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='232'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='196'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='232'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='220'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='232'
POWERLEVEL9K_VCS_GIT_ICON=''

# nvm current segment
POWERLEVEL9K_NVM_CURRENT_OK_BACKGROUND='118'
POWERLEVEL9K_NVM_CURRENT_OK_FOREGROUND='232'
POWERLEVEL9K_NVM_CURRENT_WARNING_BACKGROUND='196'
POWERLEVEL9K_NVM_CURRENT_WARNING_FOREGROUND='232'
POWERLEVEL9K_NVM_CURRENT_WARNING_ICON='✖'
POWERLEVEL9K_NVM_CURRENT_ICON='⬢'

prompt_nvm_current() {
    local nvm_current_prompt=''
    current_state=''

    if [[ -f ".nvmrc" ]]; then
        local nvm_current_version="$(nvm_prompt_info)"
        local nvm_file_version=`cat .nvmrc`

        if [[ "$nvm_current_version" == "$nvm_file_version" ]]; then
            current_state='ok'
            nvm_current_prompt="$nvm_current_version"
        else
            current_state='warning'
            nvm_current_prompt="$POWERLEVEL9K_NVM_CURRENT_WARNING_ICON $nvm_current_version"
        fi

        "$1_prompt_segment" "${0}_${(U)current_state}" "$2" "$DEFAULT_COLOR" "$DEFAULT_COLOR" "$nvm_current_prompt" 'NVM_CURRENT_ICON'
    fi
}

# status segment
POWERLEVEL9K_STATUS_OK_BACKGROUND='232'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='196'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='232'
POWERLEVEL9K_STATUS_VERBOSE=false

# time segment
POWERLEVEL9K_TIME_BACKGROUND='234'
POWERLEVEL9K_TIME_FOREGROUND='254'
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S} \ue12e"

# -- Antigen ---------------------------------------------------------------- #

source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh)
antigen bundle git
antigen bundle nvm
antigen bundle npm
antigen bundle bower
antigen bundle gulp
antigen bundle debian
antigen bundle z
antigen bundle colored-man-pages
antigen bundle command-not-found

# Syntax highlighting bundle
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Remember aliases...
antigen bundle djui/alias-tips

# Auto updating
antigen bundle unixorn/autoupdate-antigen.zshplugin

# Theme
export TERM="xterm-256color"
antigen theme bhilburn/powerlevel9k powerlevel9k
antigen apply

# Zsh syntax highlighting
# see https://gist.github.com/valegrajales/fc980807bdacf0ec1b51
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=2,bold
ZSH_HIGHLIGHT_STYLES[alias]=fg=2,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=2,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=2,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=2,bold
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=11
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=11
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=14
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=14
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=1,bold

# Clean remaining space after the right prompt
ZLE_RPROMPT_INDENT=0

# end
