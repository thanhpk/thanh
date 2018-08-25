# . .alias
. .kubernetes
. .gcp

# set PATH so it includes user's private bin directories
PATH="$HOME/workspace/bin:$HOME/.local/bin:$PATH"
export GOPATH=$HOME/workspace
export CGO_ENABLED=0

TERM=xterm-256color

setxkbmap -option ctrl:nocaps

# PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u\[\e[90m\]@\h \[\e[33m\]\w \[\e[32m\]\n\$ \[\e[0m\]'
parse_git_branch() {
	b=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	#if [ "$b" == "master" ]; then
	#	echo 'M'
	#	return
	#fi
	echo "$b"
}

parse_docker_username() {
	if hash docker 2>/dev/null && hash jq  2>/dev/null; then
			d=$(cat ~/.docker/config.json  | jq .auths.\"https://index.docker.io/v1/\".auth -c -M -r | base64 -d | cut -d":" -f1)
			echo "d:$d"
	fi
}

bold=$(tput bold)
normal=$(tput sgr0)
c_red_white="\[\e[41m\]\[\e[97m\]"
c_black_white="\[\e[0m\]\[\e[97m\]"
c_green_white="\[\e[42m\]\[\e[97m\]"
c_black_blue="\[\e[49m\]\[\e[34m\]"
c_reset="\[\e[0m\]"
function prompt_right() {
  echo -e "\033[0;36m\\\t\033[0m"
}

function prompt_left() {
  echo -e "\033[0;35m\w\033[0m"
}

PS1_DOCKER="$c_black_blue $(parse_docker_username) $c_reset"
PS1_KUBECTL="$c_red_white $(get_current_kubectl_context) $c_reset"
PS1_GIT="$c_green_white$(parse_git_branch)$c_reset"
PS1_PATH="\[\e[32m\]\[\e[33m\]\w"
PS1="\u@\h $PS1_PATH $PS1_KUBECTL$PS1_GIT$PS1_DOCKER$c_black_white\n$c_reset$ "

# PS1=$(printf -v PS1RHS "\e[0m[ \e[0;1;31m%(%b %d %H:%M)T \e[0m]" -1)
