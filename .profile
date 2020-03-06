# . $HOME/.alias
source /etc/environment

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'
alias ls='ls --color'
alias grep='grep --color'

[[ -f "$HOME/.kubernetes" ]] && . ~/.kubernetes
[[ -f "$HOME/.gcp" ]] && . ~/.gcp
[[ -f "$HOME/.auth" ]] && . ~/.auth
[[ -f "$HOME/.androidstudio" ]] && . ~/.androidstudio

# set PATH so it includes user's private bin directories
PATH="$HOME/workspace/bin:$HOME/.local/bin:$PATH"

export GOPATH=$HOME/workspace
export CGO_ENABLED=0
export GOCACHE=/tmp/go-cache/

TERM=xterm-256color

setxkbmap -option ctrl:nocaps

parse_git_branch() {
	local b=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	if [ "$b" != "" ]; then
		echo "[$b]"
	else
		echo $b
	fi
}

parse_docker_username() {
	if !(hash docker) 2>/dev/null && hash jq  2>/dev/null; then
		return
	fi
	local d=$(cat ~/.docker/config.json  | jq .auths.\"https://index.docker.io/v1/\".auth -c -M -r | base64 -d | cut -d":" -f1)
	if [ "$d" == "trancong" ]; then
		echo "d/c"
	elif ["$d" == "thanhpk" ]; then
		echo "d/t"
	elif [ "$d" != "" ]; then
		echo "d/$d"
	fi
}

c_red_white() {
	echo -e "\e[41m\e[97m"
}

c_white_yellow() {
	echo -e "\e[32m\e[33m"
}

c_black_white() {
	echo -e "\e[0m\e[97m"
}

c_green_white() {
	echo -e "\e[42m\e[97m"
}

c_default_green() {
	echo -e "\e[32m"
}

c_black_blue() {
	echo -e "\e[49m\e[34m"
}

c_default_darkgray() {
	echo -e "\e[90m"
}

c_reset() {
	echo -e "\e[0m"
}

PS1_DOCKER() {
	echo -e "$(c_default_darkgray)$(parse_docker_username) $(c_reset)"
}

PS1_KUBECTL() {
	if hash kubectl 2>/dev/null; then
		echo -e "$(c_red_white)$(get_current_kubectl_context)$(c_reset)"
	fi
}

PS1_GIT() {
	echo -e "$(c_green_white)$(parse_git_branch)$(c_reset)"
}

PS1_PATH() {
	echo -e "\e[32m\e[33m$(pwd)"
}

PS1='$(c_default_darkgray)\h $(c_white_yellow)\w $(PS1_KUBECTL)$(PS1_GIT)$(c_reset) 🔪🐙 \n$ '
