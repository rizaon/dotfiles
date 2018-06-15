
# init oh-my-zsh
source ~/.shell/oh-my-zsh.sh

# functions
source ~/.shell/function.sh

# env variables
source ~/.shell/env.sh

# aliases
source ~/.shell/alias.sh

# source local zshrc
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
