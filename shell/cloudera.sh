

export GERRIT_USER="rizaon"
export IMPALA_HOME=$WORKSPACE/impala

# enter impala home and source its config
imp() {
    cd $IMPALA_HOME
    source $IMPALA_HOME/bin/impala-config.sh
}

# create new branch based on asf-gerrit/master
branch-master() {
    git fetch asf-gerrit && git checkout -b $1 asf-gerrit/master
}

# rebase based on asf-gerrit/master
alias "rebase-master"="git fetch asf-gerrit && git rebase -i asf-gerrit/master"

