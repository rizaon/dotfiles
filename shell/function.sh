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

pathadd() {
  removeFromPath $1
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1${PATH:+":$PATH"}"
  fi
}

gbgrep() {
  git branch --sort=-committerdate \
      --format="%(color:red) %(refname:short) %(color:reset) %(contents:subject)" \
      | grep $1
}

gshell() {
  gext sh "$@"
}

gjava() {
  gext java "$@"
}

gphp() {
  gext php "$@"
}

refreshgpg() {
  echo "UPDATESTARTUPTTY" | gpg-connect-agent > /dev/null 2>&1
}
