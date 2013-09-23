export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="jonathan"
plugins=(git chpwd pip alive stashgrep ship)
source /usr/local/bin/virtualenvwrapper.sh
source $ZSH/oh-my-zsh.sh

export PATH=~/.local/bin/:/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/usr/X11/bin:$PATH
export PATH=$NAVE_PATH:$PATH
export NODE_PATH=/usr/local/lib/node

export WORKON_HOME=$HOME/Sites/virtualenvs
export PROJECT_HOME=$HOME/Sites
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

alias hero=heroku

alias git=hub
if type compdef >/dev/null; then
   compdef hub=git
fi

# Prevent git tab-autocomplete from being super slow
# From: http://talkings.org/post/5236392664/zsh-and-slow-git-completion
__git_files () {
    _wanted files expl 'local files' _files
}

alias runs='python manage.py runserver 0.0.0.0:8000'
alias running='python manage.py runserver'

alias bstack='java -jar ~/dev/BrowserStackTunnel.jar sFiLWrpJsdgTPZwLz8zu localhost,8000,0'

# pip uninstall ALL THE THINGS
alias pipdump='pip freeze | xargs -n1 pip uninstall -y'

alias reveal='open -R'

alias zshedit='vim ~/.zshrc'
alias zshupdate='source ~/.zshrc'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

. $HOME/.oh-my-zsh/plugins/z/z.sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
