# Use colors in coreutils utilities output
alias grep='grep --color'

# ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls'
alias ltail='ls -1v | tail'

alias e='emacs'
alias v='vim'
alias m='make'
alias mall='make all'
alias diff='colordiff'
alias reload='source ~/.zshrc'
alias zshrc='$EDITOR ~/.zshrc'

# git aliases
alias gits='git status'
alias gitmt='git mergetool'
alias bfg='java -jar ~/jars/bfg-1.13.0.jar'

# cd aliases
alias dotfiles='cd $DOTFILES'
alias hp='cd $HADOOP_PREFIX'
alias hconf='cd $HADOOP_CONF_DIR'
alias wp='cd $WORKSPACE'
alias dirpapers='cd $DIRPAPERS'
alias jira='cd $JIRA_REPO'
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

alias lg='ledger'
alias lgbal='ledger balance -V -p "this month"'
alias lgball='ledger balance -V'
alias lgbasis='ledger balance -B Assets'
alias lggain='ledger balance -G Assets'
alias lgreg='ledger reg -V --sort date'
alias lgbud='ledger --budget --monthly -p "this month" register ^expenses'
alias lgpri='ledger pricedb'

# navigation
alias mvd='mv $HOME/Downloads/'
