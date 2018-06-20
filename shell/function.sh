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
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1${PATH:+":$PATH"}"
  fi
}


# search utillities
gext() {
  if [ $# -lt 2 ]; then
    echo ""
    echo "  find . -name \"*.java\" -exec grep (something) '{}' \; -print  | cat -n"
    echo ""
    return
  fi

  ext="\.$1"
  shift
  srcstr="$1"
  shift

  while (( $# )); do
    echo $1
    srcstr="$srcstr.$1"
    shift
  done

  # find . -name "*.java" -exec grep "$*" '{}' \; -print  | cat -n

  # find . -name "*.java" -exec grep -i "$srcstr" '{}' \; -print  | cat -n

  echo ""

  find . -type f -name "*$ext" -exec \
  grep -i -n "$srcstr" '{}' \; -print  | \
  sed "s/^/    /" | \
  sed "s/^    \.\//-------------------------------------------/" | \
  grep -i --color ".*$ext\|$srcstr"

  echo ""
}

gsh() {
  gext sh "$@"
}

gjava() {
  gext java "$@"
}
