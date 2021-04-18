
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

# source local zshrc
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
