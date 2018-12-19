export CLICOLOR=1
# mac
export LSCOLORS=GxFxCxDxBxegedabagaced
# linux
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

export MAVEN_OPTS="-Dhttps.protocols=TLSv1.2"
export ANT_OPTS="-Dhttps.protocols=TLSv1.2"

export UCARE_DIR=$HOME/Documents/UCARE
export DIRPAPERS=$UCARE_DIR/DIR-PAPERS
export RESEARCH=$UCARE_DIR/blogs
export JIRA_REPO=$UCARE_DIR/jira-study-db-svn
export ECLIPSE_WORKSPACE=$HOME/Documents/workspace
export EDITOR=vim
export DOTFILES=$HOME/dotfiles
#export TEXINPUTS=~/pgfplots//:

# local bin
pathadd ~/bin

# macports
pathadd /opt/local/sbin
pathadd /opt/local/bin
