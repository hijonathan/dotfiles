export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="minimal"
plugins=(git chpwd pip hubpip alive)
source $ZSH/oh-my-zsh.sh

export PATH=~/.local/bin/:/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/usr/X11/bin:$PATH

export NODE_PATH=/usr/local/lib/node

export WORKON_HOME=$HOME/Sites/virtualenvs
export PROJECT_HOME=$HOME/Sites

source /usr/local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

export PATH=$NAVE_PATH:$PATH

export HS_SETTINGS_CLASS=EmptySettings
#export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

alias gitfig='git config -l'
alias git=hub
if type compdef >/dev/null; then
   compdef hub=git
fi

# Prevent git tab-autocomplete from being super slow
# From: http://talkings.org/post/5236392664/zsh-and-slow-git-completion
__git_files () {
    _wanted files expl 'local files' _files
}

alias hubspot='fab -f $PROJECT_HOME/hubspot/workstation_setup/fabfile.py'
alias hstatic='cd $PROJECT_HOME/hubspot/hubspot_static_daemon/'
alias hstaticrun='hstatic && ./hs-static run'
alias hstaticupdate='hstatic && ./hs-static update_deps'

alias ship='deployer deploy:social_web -u jkim'
alias shipp='deployer deploy:social_web,hs_env=prod -u jkim'

alias runs='python manage.py runserver 0.0.0.0:8000'
alias running='python manage.py runserver'

# pip uninstall ALL THE THINGS
alias pipdump='pip freeze | xargs -n1 pip uninstall -y'

alias zshedit='vim ~/.zshrc'
alias zshupdate='source ~/.zshrc'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

. $HOME/.oh-my-zsh/plugins/z/z.sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
alias deployer='/Users/jonathankim/Sites/hubspot/fabric_deploy/.virtualenv/bin/deployer'
