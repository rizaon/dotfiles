#compdef svn svnlite=svn svnadmin svnadmin-static=svnadmin

_svn () {
  local curcontext="$curcontext" state line expl ret=1
  typeset -A opt_args

  # Colons in values must be escaped.
  local -A show_item_keys=(
     kind                  "the kind of TARGET (file or dir)"
     url                   "the URL of TARGET in the repository"
     relative-url          "the repository-relative URL"
     repos-root-url        "the repository root URL"
     repos-uuid            "the repository UUID"
     revision              "the revision of TARGET"
     last-changed-revision "the most recent revision in which TARGET was changed"
     last-changed-date     "the date of the last-changed revision"
     last-changed-author   "the author of the last-changed revision"
     wc-root               "the working copy root path"
  )

  local update_policy
  zstyle -s ":completion:*:*:$service:*" cache-policy update_policy
  if [[ -z "$update_policy" ]]; then
    zstyle ":completion:*:*:$service:*" cache-policy _svn_caching_policy
  fi

  _arguments -C -A "-*" \
    '(-)--help[print help information]' \
    '(*)--version[print client version information]' \
    '1: :->cmds' \
    '*:: :->args' && ret=0

  if [[ -n $state ]] && (( ! $+_svn_cmds )); then
    typeset -gHA _svn_cmds
    if _cache_invalid svn-cmds || ! _retrieve_cache svn-cmds; then
      _svn_cmds=(
	${=${(f)${${"$(_call_program commands svn help)"#l#*Available subcommands:}%%Subversion is a tool*}}/(#s)[[:space:]]#(#b)([a-z-]##)[[:space:]]#(\([a-z, ?-]##\))#/$match[1] :$match[1]${match[2]:+:${${match[2]//[(),]}// /:}}:}
      )
      if (( $? == 0 )); then
        _store_cache svn-cmds _svn_cmds
      else
        # Ensure we enter this block again on the next <TAB>.
        unset _svn_cmds
      fi
    fi
  fi

  case $state in
    cmds)
      _wanted commands expl 'svn command' _svn_commands && ret=0
    ;;
    args)
      local cmd args usage idx
      typeset -gHA _cache_svn_status _cache_svn_mtime

      cmd="${${(k)_svn_cmds[(R)*:$words[1]:*]}:-${(k)_svn_cmds[(i):$words[1]:]}}"
      if (( $#cmd )); then
        curcontext="${curcontext%:*:*}:svn-${cmd}:"

	if _cache_invalid svn-${cmd}-usage || \
	    ! _retrieve_cache svn-${cmd}-usage;
	then
	  usage=${${(M)${(f)"$(_call_program options svn help $cmd)"}:#usage:*}#usage:*$cmd] }
	  _store_cache svn-${cmd}-usage usage
	fi
	if _cache_invalid svn-${cmd}-usage || \
	    ! _retrieve_cache svn-${cmd}-args;
	then
	  args=(
	    ${=${${${(M)${(f)"$(_call_program options svn help $cmd)"#(*Valid options:|(#e))}:#* :*}%% #:*}/ (arg|ARG)/:arg:}/(#b)(-##)([[:alpha:]]##) \[--([a-z-]##)\](:arg:)#/(--$match[3])$match[1]$match[2]$match[4] ($match[1]$match[2])--$match[3]$match[4]}
	  )
          while (( idx=$args[(I)*--accept:arg:] )); do
            args[idx]=( --accept'=:automatic conflict resolution action:((working\:working base\:base recommended\:recommended '"`for i j in p postpone mc mine-conflict tc theirs-conflict mf mine-full tf theirs-full e edit l launch; do print -rn $i\\\\:$j $j\\\\:$j ""; done `"'))' )
          done
          while (( idx=$args[(I)*--c(l|hangelist):arg:] )); do
            args[idx]=( \*{--cl,--changelist}'=:change list:_svn_changelists' )
          done
          while (( idx=$args[(I)*--config-dir:arg:] )); do
            args[idx]=( --config-dir'=:config dir:_directories' )
          done
	  while (( idx=$args[(I)*--config-option:arg:] )); do
	    args[idx]=( '*--config-option=: :_svn_config_options' )
	  done
          while (( idx=$args[(I)*--depth:arg:] )); do
            args[idx]=( --depth'=:operation depth (how far to recurse):(empty files immediates infinity)' )
          done
          while (( idx=$args[(I)*(-F|--file):arg:] )); do
            args[idx]=( '(-F --file)'{-F+,--file=}':log message file:_files' )
          done
          while (( idx=$args[(I)*--set-depth:arg:] )); do
            args[idx]=( --set-depth'=[make working copy deeper or shallower]:new depth:(exclude empty files immediates infinity)' )
          done
          while (( idx=$args[(I)*--trust-server-cert-failures:arg:] )); do
            args[idx]=( --trust-server-cert-failures'=:failures:_values -s , "certificate failures to ignore" "unknown-ca[unknown authority]" "cn-mismatch[hostname mismatch]" "expired[certificate expired]" "not-yet-valid[certificate not yet valid]" "other[all other failures]"' )
          done
          while (( idx=$args[(I)*--show-item:arg:] )); do
            # (q) to quote the parentheses in the value
            args[idx]=( --show-item'=:item key:(('"`for i j in ${(kv)show_item_keys}; do print -rn - $i\\\\:"${(q)j}" ""; done`"'))' )
          done
          # All other options get {-x+,--long-x=}
          args=( ${args/(#b)(--[A-Za-z0-9-]##):arg:/$match[1]=:arg:} )
          args=( ${args/(#b)([^=]):arg:/$match[1]+:arg:} )
	  _store_cache svn-${cmd}-args args
	fi

        case $cmd in;
          (add)
            args+=(
              '*:file:_files -g "*(^e:_svn_controlled:)"'
            )
          ;;
          (commit)
            args=(
	      ${args/(#b)(*--file*):arg:/$match[1]:file:_files}
              '*:file:_files -g "*(e:_svn_status:)"'
            )
          ;;
          (delete)
            args+=(
              '*:file:_files -g ".svn(/e:_svn_deletedfiles:)"'
            )
          ;;
          (diff)
            args+=(
	      '*: : _alternative "files:file:_files -g \*\(e:_svn_status:\)" "urls:URL:_svn_urls"'
	    )
          ;;
          (help)
            args+=(
              '*::sub command:_svn_commands'
            )
	  ;;
	  (import)
	    args+=(
		'1:project directory or import location: _alternative "files:file:_files" "urls:URL:_svn_urls"'
		'2:import location: _alternative "files:file:_files" "urls:URL:_svn_urls"'
	    )
          ;;
          (log)
            args+=(
              '1: : _alternative "files:file:_files -g \*\(e:_svn_controlled:\)" "urls:URL:_svn_urls"'
	      '*:file:_files -g "*(e:_svn_controlled:)"'
            )
          ;;
          (mergeinfo)
            args[(r)--show-revs=:arg:]=( '--show-revs=:revisions:(merged eligible)' )
          ;;
	  (propget|propedit|propdel)
	    args+=(
		'1:property name:_svn_props'
		'2:target: _alternative "files:file:_files" "urls:URL:_svn_urls"'
	    )
	  ;;
	  (propset)
	    args=(
	    ':propname:(svn:ignore svn:keywords svn:executable svn:eol-style svn:mime-type svn:externals svn:needs-lock svn:global-ignores svn:auto-props)'
	    ':propval:->propset_propval'
	    ${args/(#b)(*--file*):arg:/$match[1]:file:_files}
	    '*:path or url: _alternative "files:file:_files" "urls:URL:_svn_urls"'
	    )
	  ;;
          (resolved)
            args+=(
              '*:file:_files -g "*(e:_svn_conflicts:)"'
            )
          ;;
          (revert)
            args+=(
              '*:file:_files -g "(.svn|*)(/e:_svn_deletedfiles:,e:_svn_status:)"'
            )
          ;;
	  (unshelve)
	    args+=( '1:shelf name:compadd - ${${(f)"$(_call_program shelves svn unshelve -q --list)"}%%      *}' )
	  ;;
          (*)
            case $usage in
              *(SRC|DST|TARGET|URL*PATH)*)
                args+=(
	          '*: : _alternative "files:file:_files" "urls:URL:_svn_urls"'
	        )
	      ;;
              *URL*) args+=( ':URL:_svn_urls' ) ;;
              *PATH*) args+=( '*:file:_files' ) ;;
            esac
          ;;
        esac

        _arguments "$args[@]" && ret=0
        case $state in
          (propset_propval)
            case $words[2] in
              (svn:executable|svn:needs-lock) compadd yes;;
              (svn:keywords)
                compset -q
                # '_values -w' only excludes words in argv[1] or later, so
                # install a dummy argv[0].  This affects Foo in [[svn propset
                # svn:keywords 'Foo Bar Baz <TAB>]].
                words=( dummy $words ); (( ++CURRENT ))
                _values -s ' ' -w "keywords (or custom)" \
                  '(URL HeadURL)'{URL,HeadURL}'[URL for the head version of the file]' \
                  '(Author LastChangedBy)'{Author,LastChangedBy}'[last person to modify the file]' \
                  '(Date LastChangedDate)'{Date,LastChangedDate}'[date/time the file was last modified]' \
                  '(Rev Revision LastChangedRevision)'{Rev,Revision,LastChangedRevision}'[last revision the file changed]' \
                  Id'[compressed summary of URL,Revision,Date,Author]' \
                  Header"[like 'Id' but includes the full URL]";;
              (svn:eol-style) compadd - CR LF CRLF native;;
              (svn:mime-type) _mime_types;;
              (*) _message 'property value';;
            esac
        esac

      else
        _message "unknown svn command: $words[1]"
      fi
    ;;
  esac

  return ret
}

_svnadmin () {
  local curcontext="$curcontext" state line ret=1
  integer NORMARG
  local context state_descr
  typeset -A opt_args

  _arguments -C \
    '(-)--help[print help information]' \
    '(- *)--version[print client version information]' \
    '1: :->cmds' \
    '*:: :->args' && ret=0

  if [[ -n $state ]] && (( ! $+_svnadmin_cmds )); then
    typeset -gHA _svnadmin_cmds
    _svnadmin_cmds=(
      ${=${(f)${${"$(_call_program commands svnadmin help)"#l#*Available subcommands:}}}/(#s)[[:space:]]#(#b)([-a-z]##)[[:space:]]#(\([a-z, ?]##\))#/$match[1] :$match[1]${match[2]:+:${${match[2]//[(),]}// /:}}:}
    )
  fi

  case $state in
    cmds)
      _wanted commands expl 'svnadmin command' _svnadmin_commands && ret=0
    ;;
    args)
      local cmd args usage

      cmd="${${(k)_svnadmin_cmds[(R)*:$words[1]:*]}:-${(k)_svnadmin_cmds[(i):$words[1]:]}}"
      if (( $#cmd )); then
        curcontext="${curcontext%:*:*}:svnadmin-${cmd}:"

        usage=${${(M)${(f)"$(_call_program options svnadmin help $cmd)"}:#$cmd: usage:*}#$cmd: usage: svnadmin $cmd }
        args=(
          ${=${${${(M)${(f)"$(_call_program options svnadmin help $cmd)"#(*Valid options:|(#e))}:#* :*}%% #:*}/ (arg|ARG)/:arg:}/(#b)-([[:alpha:]]) \[--([a-z-]##)\](:arg:)#/(--$match[2])-$match[1]$match[3] (-$match[1])--$match[2]$match[3]}
        )
        # All options get {-x+,--long-x=}
        args=( ${args/(#b)(--[A-Za-z0-9-]##):arg:/$match[1]=:arg:} )
        args=( ${args/(#b)([^=]):arg:/$match[1]+:arg:} )
        if [[ $usage == *REPOS_PATH* ]]; then
          args+=( ":repository path:_files -/" )
          case $cmd in
            (freeze)
              args+=( "*:arguments:->normal" )
              ;;
            (hotcopy)
              args+=( ":new repository:_files -/" )
              ;;
            (setlog)
              args+=( ": :_files" )
              ;;
            (setrevprop)
              args+=( ":property name" ":property value file:_files" )
              ;;
            (delrevprop)
              args+=( ":property name" )
              ;;
          esac
        elif [[ $cmd = help ]]; then
          args+=( "*:subcommand:_svnadmin_commands" )
        fi

        _arguments -n -s -S : "$args[@]" && ret=0

        case $state in
          # Test cases:
          #   svnadmin freeze . rsync --<TAB> offers --file
          #   svnadmin freeze -- . rsync -<TAB> offers rsync's options
          #
          # Note: the NORMARG calculations here include one positional argument
          # (the '.') before the command.
          (normal)
            if (( ${words[(i)--]} < CURRENT )); then
              words[1,NORMARG]=()
              (( CURRENT -= NORMARG ))
              _normal && ret=0
            elif (( NORMARG+1 == CURRENT )); then
              # ### don't allow --options in this case
              # TODO: this should just use '_normal -F "(-*)"', but _normal ignores its arguments.
              _command_names -e && ret=0
            fi
            ;;
        esac
      else
        _message "unknown svnadmin command: $words[1]"
      fi
    ;;
  esac

  return ret
}

(( $+functions[_svn_controlled] )) ||
_svn_controlled() {
  [[ -f ${(M)REPLY##*/}.svn/text-base/${REPLY##*/}.svn-base ]]
}

(( $+functions[_svn_conflicts] )) ||
_svn_conflicts() {
  [ -n $REPLY.(mine|r<->)(N[1]) ]
}

(( $+functions[_svn_deletedfiles] )) ||
_svn_deletedfiles() {
  # Typical usage would be _files -g '.svn(/e:_svn_deletedfiles:)'
  local cont controlled
  reply=( )
  [[ $REPLY = (*/|).svn ]] || return
  controlled=( $REPLY/text-base/*.svn-base(N:r:t) )
  for cont in ${controlled}; do
    [[ -e $REPLY:h/$cont ]] || reply+=( ${REPLY%.svn}$cont )
  done
}

(( $+functions[_svn_status] )) ||
_svn_status() {
  local dir=$REPLY:h
  local pat="${1:-([ADMR~]|?M)}"

  zmodload -F zsh/stat b:zstat 2>/dev/null
  local key="$(zstat +device $dir):$(zstat +inode $dir)"
  local mtime="$(zstat +mtime $dir/.svn/entries)"

  if (( ! $+_cache_svn_status[$key] || _cache_svn_mtime[$key] != mtime )); then
    _cache_svn_status[$key]="$(_call_program files svn status -N $dir)"
    _cache_svn_mtime[$key]="$mtime"
  fi

  (( ${(M)#${(f)_cache_svn_status[$key]}:#(#s)${~pat}*$REPLY} ))
}

(( $+functions[_svn_remote_paths] )) ||
_svn_remote_paths() {
  local expl remfiles remdispf remdispd suf ret=1 pfx='\^/' sub='^/'

  # prefix must match a valid repository path format, either standard style
  # schema://host/path/.. or ^/path/.. specifying a path relative to the
  # root of the working directory repository.  In the second form, allow the
  # leading '^' be escaped in case the user has the extendedglob option set.
  [[ -prefix *://*/ ]] ||
  [[ -f .svn/entries && ( -prefix '^/' || -prefix '\^/' ) ]] ||
  return 1

  # return if remote access is not permitted
  zstyle -T ":completion:${curcontext}:" remote-access || return 1

  remfiles=( ${(f)"$(svn list $IPREFIX${${PREFIX%%[^/]#}/#$pfx/$sub} 2>/dev/null)"} )
  (( $? == 0 )) || return 1

  # you might consider trying to return early if $#remfiles is zero,
  # but for whatever reason remfiles will always contain at least a
  # single empty string; that case is handled correctly below.

  compset -P '*/'
  compset -S '/*' || suf=file
  remdispf=(${remfiles:#*/})
  remdispd=(${(M)remfiles:#*/})
  _tags files
  while _tags; do
    while _next_label files expl ${suf:-directory}; do
      # add files, unless there is a '/' immediately to the right
      [[ -n $suf ]] &&
      compadd -S ' ' -q "$@" "$expl[@]" -d remdispf $remdispf && ret=0
      # add directories; use empty suffix if there is a '/' immediately to the right
      compadd -S "${suf:+/}" -q "$@" "$expl[@]" -d remdispd ${remdispd%/} && ret=0
    done
    (( ret )) || return 0
  done

  return 1
}

(( $+functions[_svn_urls] )) ||
_svn_urls() {
  local urlsch expl ret=1

  # first try completing a remote path; if successful, we are all done..
  _svn_remote_paths && return 0

  # allow configuring svn repository locations using the 'urls' zstyle.
  # always attempt completion of these because then matcher-list styles
  # which do substring matching will work correctly.
  _urls -S/ && ret=0

  if [[ ! -prefix *://? ]] ; then
    zstyle -a ":completion:${curcontext}:" url-schemas urlsch \
     || urlsch=( file:// http:// https:// svn:// svn+ssh:// )

    if (( $#urlsch )) ; then
      compset -S '[^:]*'
      _wanted url-schemas expl 'URL schema' compadd -S '' - $urlsch[@] && ret=0
    fi
  fi

  return ret
}

(( $+functions[_svn_commands] )) ||
_svn_commands() {
  compadd "$@" -k _svn_cmds || compadd "$@" ${(s.:.)_svn_cmds}
}

(( $+functions[_svnadmin_command] )) ||
_svnadmin_commands() {
  compadd "$@" -k _svnadmin_cmds || compadd "$@" ${(s.:.)_svnadmin_cmds}
}

(( $+functions[_svn_config_options] )) ||
_svn_config_options() {
  local -a expl suf
  local cfgfile
  compset -S ':*' || suf=( -qS : )
  if compset -P 2 '*:'; then
    if compset -P '*='; then
      _message -e values 'value'
    else
      _message -e options 'option'
    fi
  elif compset -P 1 '*:'; then
    cfgfile=( ~/.subversion/${(M)${IPREFIX%:}%(config|servers)}(N) /dev/null )
    _description sections expl 'section'
    compadd $suf "$expl[@]" ${${${(M)${(f)"$(<${cfgfile[1]})"}:#\[*\]}#\[}%\]}
  else
    _description config-files expl 'configuration file'
    compadd $suf "$expl[@]" config servers
  fi
}

(( $+functions[_svn_props] )) ||
_svn_props() {
  local properties

  properties=( ${${(M)${(f)"$(svn proplist 2>/dev/null)"}:#  [^ ]*}#  } )
  compadd "$@" -a properties && return 0
}

(( $+functions[_svn_changelists] )) ||
_svn_changelists() {
  local cls

  cls=( ${${${(M)${(f)"$(_call_program changelists svn status 2>/dev/null)"}:#--- Changelist*}%??}##*\'} )
  compadd "$@" -a cls && return 0
}

_subversion () {
  case $service in
    (svn) _svn "$@" ;;
    (svnadmin) _svnadmin "$@" ;;
  esac
}

_svn_caching_policy() {
  [[ =$service -nt $1 ]]
}

_subversion "$@"
