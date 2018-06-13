#!/bin/zsh

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

function setjdk() {
  if [ $# -ne 0 ]; then
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
   if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
   fi
   export JAVA_HOME=`/usr/libexec/java_home -v $@`
   export PATH=$JAVA_HOME/bin:$PATH
  fi
}

function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}


export UCARE_DIR=/Users/riza/Documents/UCARE
export DIRPAPERS=$UCARE_DIR/DIR-PAPERS
export RESEARCH=$UCARE_DIR/blogs
export JIRA_REPO=$UCARE_DIR/jira-study-db-svnrepo
export ECLIPSE_WORKSPACE=/Users/riza/Documents/workspace
export EDITOR=vim
export DOTFILES=~/dotfiles
#export TEXINPUTS=~/pgfplots//:


alias ll='ls -la'
alias e='emacs'
alias m='make'
alias mall='make all'
alias diff='colordiff'

# git aliases
alias gits='git status'
alias gitmt='git mergetool'

# cd aliases
alias dotfiles='cd $DOTFILES'
alias hp='cd $HADOOP_PREFIX'
alias hconf='cd $HADOOP_CONF_DIR'
alias wp='cd $ECLIPSE_WORKSPACE'
alias dirpapers='cd $DIRPAPERS'
alias jira='cd $JIRA_REPO'
alias ucare='cd $UCARE_DIR'
alias copaper='cd $UCARE_DIR/futurexx-cobe-svn/v0'
alias cotrace='cd $UCARE_DIR/cobe-analysis-svn'
alias cobugs='cd $JIRA_REPO/special-bugs/co-cascadingOutage'
alias cocode='cd $ECLIPSE_WORKSPACE/cobe'
alias candidacy='cd $UCARE_DIR/riza-candidacy-exam'

# source local zshrc
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
