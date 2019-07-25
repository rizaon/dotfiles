
export CLICOLOR=1
# mac ls
#export LSCOLORS=GxFxCxDxBxegedabagaced
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export MAVEN_OPTS="-Dhttps.protocols=TLSv1.2"
export ANT_OPTS="-Dhttps.protocols=TLSv1.2"

export UCARE_DIR=$HOME/Documents/UCARE
export DIRPAPERS=$UCARE_DIR/DIR-PAPERS
export RESEARCH=$UCARE_DIR/blogs
export JIRA_REPO=$UCARE_DIR/jira-study-db-svn
export ALL_PDF_FILES=$HOME/my-pdfs
export ECLIPSE_WORKSPACE=$HOME/Documents/workspace
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
fi

# GNU ls (linux), use dircolors database
eval `dircolors ~/.dir_colors`
