export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="jonathan"
plugins=(git chpwd pip alive stashgrep bstack)
source /usr/local/bin/virtualenvwrapper.sh
source $ZSH/oh-my-zsh.sh

export NODE_PATH=/usr/local/lib/node
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/usr/X11/bin:$PATH
export PATH=$NAVE_PATH:$PATH

export WORKON_HOME=$HOME/Sites/virtualenvs
export PROJECT_HOME=$HOME/Sites
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

if type compdef >/dev/null; then
   compdef hub=git
fi

# Prevent git tab-autocomplete from being super slow
# From: http://talkings.org/post/5236392664/zsh-and-slow-git-completion
__git_files () {
    _wanted files expl 'local files' _files
}

# Load NVM.
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh

# Load z.
. $HOME/.oh-my-zsh/plugins/z/z.sh
eval "$(rbenv init -)"
