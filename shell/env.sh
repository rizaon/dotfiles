
# fix color scheme while inside tmux
[[ $TMUX != "" ]] && export TERM="screen-256color"

export CLICOLOR=1
# mac ls
#export LSCOLORS=GxFxCxDxBxegedabagaced
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export MAVEN_OPTS="-Dhttps.protocols=TLSv1.2"
export ANT_OPTS="-Dhttps.protocols=TLSv1.2"

export UCARE_DIR=$HOME/Documents/UCARE
export DIRPAPERS=$UCARE_DIR/DIR-PAPERS
export RESEARCH=$HOME/Documents/blogs
export JIRA_REPO=$UCARE_DIR/jira-study-db-svn
export ALL_PDF_FILES=$HOME/my-pdfs
export WORKSPACE=$HOME/workspace
export EDITOR=vim
export DOTFILES=$HOME/dotfiles
#export TEXINPUTS=~/pgfplots//:

# gpg tty
export GPG_TTY=$(tty)

# local bin
pathadd ~/bin

# GNU coreutils path on Homebrew
gnubin="/usr/local/opt/coreutils/libexec/gnubin"
if [ -d "$gnubin" ]; then
    pathadd $gnubin

    # use ls (gls) from coreutils
    alias ls="gls --color=auto"
fi

# GNU ls (linux), use dircolors database
eval `dircolors ~/.dir_colors`

# mac keyboard shortcut
# https://coderwall.com/p/a8uxma/zsh-iterm2-osx-shortcuts
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# zsh-syntax-highlighting
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
