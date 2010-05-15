# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/greg/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
alias s2ram="sudo s2ram -f"
alias clock="tty-clock -c -C 1"
alias ed="emacsclient -t"
alias sued="sudo emacs -nw"
alias  -g ls="ls --color=auto"
alias irssi="screen irssi"
alias kb="setxkbmap us"
alias scan="brsaneconfig3 -a name=\"MFC-790CW\" model=\"MFC-790CW\" ip=192.168.1.54"
alias ncmpcpp="ncmpcpp -h 127.0.0.1"
alias xrdb="xrdb ~/.Xdefaults"
#alias finch="screen finch"

PAGER='less'
EDITOR='emacsclient'
BROWSER='conkeror'

local YELLOW=$'%{\e[1;33m%}'
local GREY=$'%{\e[1;30m%}'
local NORMAL=$'%{\e[0m%}'
local BLUE=$'%{\e[1;34m%}'

#export PS1="$(print "${GREY}[${BLUE}%n${GREY}][${BLUE}%~${GREY}]${BLUE} %(!.#.$) ${NORMAL}")"
export PS1="%{$fg[white]%}┌─[%{$fg[green]%}%n%{$fg[cyan]%}@%{$fg[green]%}%m%{$fg[white]%}:%{$fg[yellow]%}%~%{$fg[white]%}]%{$fg[yellow]%}-%{$fg[red]%}[%{$fg[cyan]%}%*%{$fg[red]%}]%{$reset_color%}%{$reset_color%}"$'\n'"%{$fg[white]%}└─>%{$reset_color%} "
#cat ~/start
#uname -r
#mpc|grep "-"
