# Path to your oh-my-zsh installation.
ZSH=~/.oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

#mine
setopt nohup
setopt auto_cd     # cd to folder without typing 'cd'
setopt cdable_vars # like cd $var but without explicit '$'
#mine_end

#
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

export TERM="xterm-256color"

# Vi-mode--
bindkey '^[OA' history-beginning-search-backward
bindkey '^[OB' history-beginning-search-forward
bindkey '^P'   history-beginning-search-backward
bindkey '^N'   history-beginning-search-forward
# --Vi-mode

alias mv="mv -iv"
alias cp="cp -iv"
alias ta="tmux attach -t"
alias tl="tmux list-sessions"

export EDITOR=vim

# VIM
# to be able open files in already existing vim session
alias vim="vim --servername VIM"

remote_vim() {
  # $2 - file path
  [[ $1 != "vsp" ]] && [[ $1 != "sp" ]] && echo 'wrong split command' && return 1;
  file_path=`realpath $2`
  file_path=${file_path/\ /\\ }
  vim --remote-send ":$1 $file_path<CR>";
}

alias rvim="vim --remote"
alias rvimtab="vim --remote-tab"
alias rvimsp="remote_vim sp"
alias rvimvsp="remote_vim vsp"

alias dm="docker-machine"
alias dc="docker-compose"

# Etc--
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

alias clang++11="clang++ -std=c++11"
alias clang++14="clang++ -std=c++14"
alias clang++17="clang++ -std=c++17"

alias http_codes="node -e 'console.log(require(\"http\").STATUS_CODES)'"
alias ccat=pygmentize
alias btg="source ~/developer/gits/backtogit/backtogit.sh"
alias currbr="git br | grep '*' | tr -d '* '"
# --Etc

# VLC fonts
export FONTCONFIG_PATH=/opt/X11/lib/X11/fontconfig

alias today="echo \$(date +'%Y-%m-%d')"
alias mkdirdate="mkdir \$(today)"

alias svnvimdiff="svn diff --diff-cmd=~/developer/\\*sh/svnvimdiff.sh"

# restore a session
alias rsvim="vim -S ~/.vim/tmp_session"

PS1="${PS1}"$'\n'" %F{blue}λ %F{grey} "
