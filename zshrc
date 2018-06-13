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


export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home
#setjdk 1.8
export ANT_HOME=/opt/local/share/java/apache-ant

#export HADOOP_PREFIX=/Users/riza/Documents/workspace/hadoop-ucare/hadoop-dist/target/hadoop-2.7.1
export HADOOP_PREFIX=/Users/riza/Documents/workspace/hadoop-ucare/hadoop-dist/target/hadoop-2.8.0
#export HADOOP_CONF_DIR=/Users/riza/Documents/workspace/HADOOP_CONF
export HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop
export HADOOP_HOME=$HADOOP_PREFIX
export HADOOP_INSTALL=$HADOOP_HOME
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HADOOP_CLASSPATH=$(find $HADOOP_HOME -name '*.jar' | xargs echo | tr ' ' ':')
export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:$JAVA_HOME/lib/tools.jar
#export MAVEN_OPTS=-Xmx1G
export PATH=$HADOOP_HOME/sbin:$HADOOP_HOME/bin:/usr/local/php5/bin:/Users/riza/bin:$PATH


#export PINTOS_DIR=~/pintos_2014/pintos
#export TOOLS_DIR=~/pintos_2014/pintos-tools
#export BOCHS_LOCATION=~/pintos_2014
#export PATH=/Users/riza/pintos_2014/pintos-tools/bin:$PATH

export UCARE_DIR=/Users/riza/Documents/UCARE
export DIRPAPERS=$UCARE_DIR/DIR-PAPERS
export RESEARCH=$UCARE_DIR/blogs
export JIRA_REPO=$UCARE_DIR/jira-study-db-svnrepo
export ECLIPSE_WORKSPACE=/Users/riza/Documents/workspace
export EDITOR=emacs
#export TEXINPUTS=~/pgfplots//:

# The next line updates PATH for the Google Cloud SDK.
source '/Users/riza/bin/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/riza/bin/google-cloud-sdk/completion.bash.inc'

alias ll='ls -la'
alias e='emacs'
alias m='make'
alias mall='make all'
alias diff='colordiff'

# git aliases
alias gits='git status'
alias gitmt='git mergetool'

# cd aliases
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

export PATH="~/.composer/vendor/bin:/Users/riza/bin/popper/cli/bin:$PATH"

##
# Your previous /Users/riza/.bash_profile file was backed up as /Users/riza/.bash_profile.macports-saved_2015-11-24_at_17:16:23
##

# MacPorts Installer addition on 2015-11-24_at_17:16:23: adding an appropriate PATH variable for use with MacPorts.
# export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/riza/.bash_profile file was backed up as /Users/riza/.bash_profile.macports-saved_2016-10-27_at_19:59:11
##

# MacPorts Installer addition on 2016-10-27_at_19:59:11: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

