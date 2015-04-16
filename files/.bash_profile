# Using some customization based on: https://github.com/mathiasbynens/dotfiles
if [ "$PS1" ] && [ "$BASH" ] && [ "$BASH" != "/bin/sh" ]; then
  . ~/.git_prompt/gitstatus.sh
  
  # Save current working dir
  PROMPT_COMMAND='pwd > "${HOME}/.cwd"'
fi

export PATH="$HOME/bin:$HOME/software/bin:$HOME/local/bin:/opt/bin:$PATH"

export EDITOR="subl -w"
export BROWSER="google-chrome"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [ -d "$HOME/global_npm" ]; then
  export PATH="./node_modules/.bin:$HOME/global_npm/bin:$PATH"
  export NODE_PATH="$NODE_PATH:$HOME/global_npm/lib/node_modules"
fi

[[ -s "$HOME/perl5/perlbrew/etc/bashrc" ]] && source ~/perl5/perlbrew/etc/bashrc # This loads perlbrew

if [ -d "$HOME/work/treex" ]; then
  export PATH="$HOME/work/treex/bin:$PATH"
  export PERL5LIB="$HOME/work/treex/lib:$HOME/work/treex/oldlib:$PERL5LIB"
  export TMT_ROOT="$HOME/.treex"
fi

if [ -d "$HOME/work/tred/tred" ]; then
  export PATH="$HOME/work/tred/tred:$PATH"
fi

# Increase size of bash history
HISTFILESIZE=10000

# locale
LANG="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

# default add color to ls
# G - colorized output
# F - Visual Classification of Files With Special Characters
# a - show hidden files/folders
# l - list format
alias ls="ls -GFalh"
alias sl="ls"

# Add to grep: color, line numbers, context of 1 line
alias grep="grep --color -n -B 1"

# show folders
alias lp="ls -p"

# a couple misc/simple commands
alias h="history"
alias "cd.."="cd .."
alias ".."="cd .."

# From alias.sh
# go back x directories
function b() {
    str=""
    count=0
    while [ "$count" -lt "$1" ];
    do
        str=$str"../"
        let count=count+1
    done
    cd $str
}

# Handy Extract Program.
function extract() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2)   tar xvjf $1     ;;
      *.tar.gz)    tar xvzf $1     ;;
      *.bz2)       bunzip2 $1      ;;
      *.rar)       unrar x $1      ;;
      *.gz)        gunzip $1       ;;
      *.tar)       tar xvf $1      ;;
      *.tbz2)      tar xvjf $1     ;;
      *.tgz)       tar xvzf $1     ;;
      *.zip)       unzip $1        ;;
      *.Z)         uncompress $1   ;;
      *.7z)        7z x $1         ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
   echo "'$1' is not a valid file"
  fi
}

# create .tar.gz archive
function compress() {
  tar -cvzf $1 $2
}

# make a note with geeknote
function journal-entry() {
  local title="`date +%Y-%m-%d` - $1"
  geeknote create --title "$title" --notebook Journal && geeknote edit --note "$title" --content WRITE  
}

# make and cd into a directory
function mcd() {
  mkdir -p "$1" && cd "$1";
}

# search for process
alias tm='ps -ef | grep'

# show which commands you use the most
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'


if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# execute only for interactive shell
if [ "$PS1" ] && [ "$BASH" ] && [ "$BASH" != "/bin/sh" ]; then
  [[ -f "${HOME}/.cwd" ]] && cd "$(< ${HOME}/.cwd)"
fi
