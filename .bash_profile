# colors
export PS1="\[\033[38;5;218m\]\u\[\033[m\]:\[\033[38;5;140m\]\w\[\033[m\]\$(parse_git_branch)\[\033[00m\]\n$ "
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
export TERM=screen-256color

# Shortcuts
alias ls='ls -GFh'
alias ll='ls -l'
alias c='clear'
alias grep='grep --color -n -r'

# PATH
export GOPATH=~/go
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.npm-packages/bin:$PATH"

### command lines ###

# pull all the repos under a github account
# $ pull-all <file/path/>
pull-all() {
  find "$1" -type d -depth 1 -exec git --git-dir={}/.git --work-tree={} pull origin master \;
}

# Show the git branch name
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Export csv from .sql files
# psqlcsv $PSQLSERVICE $SQLFILE
psqlcsv() {
  psql service="$1" -q -c '\timing off' -c "\copy (`cat "$2" | tr "\n" " "`) TO STDOUT WITH (FORMAT CSV, HEADER)"
}

# iTerm 2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

