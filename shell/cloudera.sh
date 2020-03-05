

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

# fetch temporary AWS S3 key
fetch-aws-key() {
    ssh s3@cloudcat.infra.cloudera.com impaladev
}

# rebase based on asf-gerrit/master
alias "rebase-master"="git fetch asf-gerrit && git rebase -i asf-gerrit/master"

ide-impala() {
    cd $IMPALA_HOME
    source $IMPALA_HOME/bin/impala-config.sh
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        clion.sh $IMPALA_HOME
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        clion $IMPALA_HOME
    fi
}
