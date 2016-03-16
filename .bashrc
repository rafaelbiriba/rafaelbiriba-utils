PATH=$PATH:$HOME/.rvm/bin:/usr/local/sbin # Add RVM to PATH for scripting
# RVM (Ruby)
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm
# change the title of the OS X terminal window
# See http://hints.macworld.com/article.php?story=20031015173932306
#export PROMPT_COMMAND='echo -ne "\033]0;$@\007"'
#export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
#export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}/\007"'

# Color constants
NO_COLOR='\e[0m' #disable colors
TXTBLK='\e[0;30m' # Black - Regular
TXTRED='\e[0;31m' # Red
TXTGRN='\e[0;32m' # Green
TXTYLW='\e[0;33m' # Yellow
TXTBLU='\e[0;34m' # Blue
TXTPUR='\e[0;35m' # Purple
TXTCYN='\e[0;36m' # Cyan
TXTWHT='\e[0;37m' # White
BLDBLK='\e[1;30m' # Black - Bold
BLDRED='\e[1;31m' # Red
BLDGRN='\e[1;32m' # Green
BLDYLW='\e[1;33m' # Yellow
BLDBLU='\e[1;34m' # Blue
BLDPUR='\e[1;35m' # Purple
BLDCYN='\e[1;36m' # Cyan
BLDWHT='\e[1;37m' # White
UNDBLK='\e[4;30m' # Black - Underline
UNDRED='\e[4;31m' # Red
UNDGRN='\e[4;32m' # Green
UNDYLW='\e[4;33m' # Yellow
UNDBLU='\e[4;34m' # Blue
UNDPUR='\e[4;35m' # Purple
UNDCYN='\e[4;36m' # Cyan
UNDWHT='\e[4;37m' # White
BAKBLK='\e[40m'   # Black - Background
BAKRED='\e[41m'   # Red
BAKGRN='\e[42m'   # Green
BAKYLW='\e[43m'   # Yellow
BAKBLU='\e[44m'   # Blue
BAKPUR='\e[45m'   # Purple
BAKCYN='\e[46m'   # Cyan
BAKWHT='\e[47m'   # White
TXTRST='\e[0m'    # Text Reset

BRIGHT_RED="\[\033[1;31m\]"
DULL_WHITE="\[\033[0;37m\]"
BRIGHT_WHITE="\[\033[1;37m\]"

function parse_git_branch {
ref=$(git symbolic-ref HEAD 2> /dev/null) || return
echo "("${ref#refs/heads/}")"
}

# GIT shortcuts
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -a -v'
alias gd='git diff | mate'
alias gl='git pull'
alias gp='git push'
alias gpp='git pull;git push'
alias gppd='git pull origin dev;git push origin dev'
alias gst='git status'
alias ga='git add . -v'
alias gs='git status'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gitrollback='git reset --hard; git clean -f'
alias gunadd='git reset HEAD'

# Developer alias
alias startmongo='mongod --config /usr/local/etc/mongod.conf &'
alias startredis='redis-server /usr/local/etc/redis.conf &'

# Command prompt config
PS1="\[$BLDWHT\](\D{%F %T}) \[$UNDYLW\]\u@\H\[$TXTWHT\]\n\[$TXTRED\]#\# \[$TXTWHT\]\w ${BAKRED}\$(parse_git_branch)${TXTWHT}>>\[$NO_COLOR\] "
# PS1="${DULL_WHITE}\w${BRIGHT_RED} \$(parse_git_branch)${BRIGHT_WHITE}\$ "
