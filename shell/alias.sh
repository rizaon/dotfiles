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

# cd aliases
alias dotfiles='cd $DOTFILES'
alias hp='cd $HADOOP_PREFIX'
alias hconf='cd $HADOOP_CONF_DIR'
alias wp='cd $ECLIPSE_WORKSPACE'
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
alias dex='docker exec -it'
alias dcup='docker-compose up'
alias dcdown='docker-compose down'
alias dcbuild='docker-compose build --no-cache'
alias dcex='docker-compose exec'
alias dcps='docker-compose ps'

