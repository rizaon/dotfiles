
# init zsh autocompletion
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# init oh-my-zsh
source ~/.shell/oh-my-zsh.sh

# fix svn autocomplete
source ~/.shell/_subversion.sh

# functions
source ~/.shell/function.sh

# init autojump
source ~/.shell/autojump.sh

# env variables
source ~/.shell/env.sh

# aliases
source ~/.shell/alias.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Cloudera specific scripts
source ~/.shell/cloudera.sh

# load Cloudera aws-okta script
source ~/.shell/bashrc_aws-okta

# source local dwx env
if [ -f ~/.dwx_rc.sh ]; then
    source ~/.dwx_rc.sh
fi

# source local zshrc
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

