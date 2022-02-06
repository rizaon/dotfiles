# Use colors in coreutils utilities output
alias grep='grep --color'

# ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls'
alias ltail='ls -1v | tail'

# editor aliases
alias e='editor'
alias vfind='vim `fzf`'
alias efind='emacs `fzf`'

# git aliases
alias gdh='git diff HEAD'
alias gbranch='git branch --format="%(color:red) %(refname:short) %(color:reset) %(contents:subject)"'

# cd aliases
alias dotfiles='cd $DOTFILES'
alias hp='cd $HADOOP_PREFIX'
alias hconf='cd $HADOOP_CONF_DIR'
alias wp='cd $WORKSPACE'
alias dirpapers='cd $DIRPAPERS'
alias ucare='cd $UCARE_DIR'
alias copaper='cd $UCARE_DIR/cobe/futurexx-cobe-svn/v0'
alias cotrace='cd $UCARE_DIR/cobe/cobe-analysis-svn'
alias cobugs='cd $JIRA_REPO/special-bugs/co-cascadingOutage'
alias cocode='cd $ECLIPSE_WORKSPACE/cobe'
alias candidacy='cd $UCARE_DIR/riza-candidacy-exam'

# up alias
alias u='cd ../'
alias uu='cd ../../'
alias uuu='cd ../../../'
alias uuuu='cd ../../../../'
alias uuuuu='cd ../../../../../'

# docker alias
alias dps='docker ps -a'
alias dx='docker exec -it'
alias dcup='docker-compose up'
alias dcdown='docker-compose down'
alias dcbuild='docker-compose build --no-cache'
alias dcx='docker-compose exec'
alias dcps='docker-compose ps'

# some utils
alias pjson='python -m json.tool'
alias m='make'
alias mall='make all'
alias diff='colordiff'
alias reload='source ~/.zshrc'
alias zshrc='$EDITOR ~/.zshrc'

# navigation
alias mvd='mv $HOME/Downloads/'
