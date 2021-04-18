

export GERRIT_USER="rizaon"
export IMPALA_HOME=$WORKSPACE/impala

# enter impala home and source its config
enter-impala() {
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

ide-impala() {
    cd $IMPALA_HOME
    source $IMPALA_HOME/bin/impala-config.sh
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        clion.sh $IMPALA_HOME
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        clion $IMPALA_HOME
    fi
}

# forward Impala Web UI of coordinator node in DWX
forward-dwx() {
    impala_ns=$1
    kubectl port-forward coordinator-0 -n $impala_ns 25000:25000
}

# Jupyter notebook shortcut from
# https://ljvmiranda921.github.io/notebook/2018/01/31/running-a-jupyter-notebook/
jpt() {
    # Fires-up a Jupyter notebook by supplying a specific port
    jupyter notebook --no-browser --port=$1
}
jptt() {
    local_port=$1
    remote_port=$2
    # Forwards port $1 into port $2 and listens to it
    ssh -N -L localhost:${remote_port}:localhost:${local_port} lars
}

# ssh to halxg
halxg() {
    ssh -i ~/.ssh/id_rsa_systest -o StrictHostKeyChecking=no systest@$1.halxg.cloudera.com
}

# rebase based on asf-gerrit/master
alias "rebase-master"="git fetch asf-gerrit && git rebase -i asf-gerrit/master"
alias imptest="impala-py.test"
alias impflake8="impala-flake8"
alias impstart="start-impala-cluster.py"
alias impkill="start-impala-cluster.py --kill"
alias imptool="docker run -i apache/impala:81d5377c2-impala_profile_tool"
alias zgrv="$HOME/workspace/zgrviewer-0.10.0/run.sh"

