# .zshrc

# -- Powerlevel9k ------------------------------------------------------------ #

# general
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='\e[1D'
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{233}%K{233} %K{default} %F{default}'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(background_jobs context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status nvm_checker command_execution_time time)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# background jobs segment
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='232'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='14'

# context segment
POWERLEVEL9K_CONTEXT_TEMPLATE="%n"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='053'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='255'
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
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='082'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='232'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='196'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='232'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='226'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='232'
POWERLEVEL9K_VCS_GIT_ICON=''

# nvm checker segment
POWERLEVEL9K_NVM_CHECKER_OK_BACKGROUND='082'
POWERLEVEL9K_NVM_CHECKER_OK_FOREGROUND='232'
POWERLEVEL9K_NVM_CHECKER_WARNING_BACKGROUND='196'
POWERLEVEL9K_NVM_CHECKER_WARNING_FOREGROUND='232'
POWERLEVEL9K_NVM_CHECKER_WARNING_ICON='✖'
POWERLEVEL9K_NVM_CHECKER_ICON='⬢'

# status segment
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='196'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='237'
POWERLEVEL9K_STATUS_VERBOSE=false

# command execution time segment
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='232'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='75'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1

# time segment
POWERLEVEL9K_TIME_BACKGROUND='234'
POWERLEVEL9K_TIME_FOREGROUND='254'
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S} \ue12e"

# Custom nvm checker segment
# Display the segment only if .nvmrc exists and compare the required version to the current version
prompt_nvm_checker() {
  [[ ! $(type nvm) =~ 'nvm is a shell function'* ]] && return

  local node_version=$(nvm current)
  node_version=${node_version:1}
  [[ -z "${node_version}" ]] || [[ ${node_version} = "none" ]] && return

  typeset -AH nvm_checker_states
  nvm_checker_states=(
    "OK"            "yellow"
    "WARNING"       "red"
  )

  local content=''
  local current_state=''

  if [[ -f ".nvmrc" ]]; then
    local node_version_required=$(cat .nvmrc)

    if [[ "${node_version_required:0:1}" = "v" ]]; then
        node_version_required=${node_version_required:1}
    fi

    if [[ "$node_version_required" == "$node_version" ]]; then
        current_state='OK'
        content="$node_version"
    else
        current_state='WARNING'
        content="$node_version"
    fi

    "$1_prompt_segment" "${0}_${current_state}" "$2" "${nvm_checker_states[$current_state]}" "$DEFAULT_COLOR" "${content}" 'NVM_CHECKER_ICON'
  fi
}

# -- Antigen ----------------------------------------------------------------- #

source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh)
antigen bundle git
antigen bundle nvm
antigen bundle npm
antigen bundle bower
antigen bundle yarn
antigen bundle gulp
antigen bundle docker
antigen bundle docker-compose
antigen bundle z
antigen bundle colored-man-pages
antigen bundle command-not-found

# MacOS bundles
antigen bundle brew

# Linux bundles
# antigen bundle debian

# Syntax highlighting bundle
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Remember aliases...
antigen bundle djui/alias-tips

# Theme
export TERM="xterm-256color"
antigen theme bhilburn/powerlevel9k powerlevel9k
antigen apply

# Zsh syntax highlighting
# see https://gist.github.com/valegrajales/fc980807bdacf0ec1b51
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=46,bold
ZSH_HIGHLIGHT_STYLES[alias]=fg=46,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=46,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=46,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=46,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=46,bold
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=46,bold
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=226
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=226
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=51
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=51
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=196,bold

# disable history sharing between each terminal session
unsetopt share_history

# -- Aliases ----------------------------------------------------------------- #

alias dclf="docker-compose logs --tail=\"500\" -f"

# end
