# source /etc/environment

[[ -f "$HOME/.kubernetes" ]] && . ~/.kubernetes
[[ -f "$HOME/.gcp" ]] && . ~/.gcp
[[ -f "$HOME/.androidstudio" ]] && . ~/.androidstudio

# set PATH so it includes user's private bin directories
PATH="$HOME/go/bin:$HOME/.local/bin:$PATH"

export CGO_ENABLED=0
export GOCACHE=/tmp/go-cache/

TERM=xterm-256color

__bg () {
	# map caplock to ctrl
  setxkbmap -query | grep options | tr -s " " "\n" | sed -n 2p | grep -q "ctrl:nocaps" && true || setxkbmap -option ctrl:nocaps
}

(__bg &)

parse_git_branch() {
	local b=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	if [ "$b" != "" ]; then
		echo "[$b]"
	else
		echo $b
	fi
}

c_red_white() {
	echo -e "\e[41m\e[97m"
}

c_red_yellow() {
	echo -e "\e[0m\e[93m"
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

c_default_lightgray() {
	echo -e "\e[37m"
}

c_reset() {
	echo -e "\e[0m"
}

PS1_GIT() {
	echo -e "$(c_green_white)$(parse_git_branch)$(c_reset)"
}

PS1_KUBECTL() {
	if hash kubectl 2>/dev/null; then
		if [ "$(get_current_kubectl_context)" == "prod" ]; then
			echo -e "$(c_red_white)$(get_current_kubectl_context)$(c_reset)"
		fi

		if [ "$(get_current_kubectl_context)" == "dev" ]; then
			echo -e "$(c_black_blue)$(get_current_kubectl_context)$(c_reset) "
		fi
	fi
}

PS1='$(c_default_lightgray)$(hostname)$(c_reset) $(c_white_yellow)\w $(PS1_KUBECTL)$(PS1_GIT)$(c_reset)\n$ '
