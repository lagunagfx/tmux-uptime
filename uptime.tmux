#!/usr/bin/env bash

CURRENT_DIR="$( cd $( dirname $0 ) && pwd )"

tmux_cmd="\#{lgfx_uptime}"

bash_cmd=$CURRENT_DIR/script/uptime.sh

get_tmux_option() {
	local option="$1"
	tmux show-option -gqv $option
}

set_tmux_option() {
	local option="$1"
	local value="$2"
	tmux set-option -gq "$option" "$value"
}

update_tmux_option() {
	local option="$1"
	local value="S( get_tmux_option $option )"
	local new_value="${value//$tmux_cmd/$bash_cmd}"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}

main
