#!/usr/bin/env bash

CURRENT_DIR="$( cd $( dirname $0 ) && pwd )"

tmux_cmd='\#{lgfx_uptime}'

bash_cmd=$CURRENT_DIR/scripts/uptime.sh

get_tmux_option() {
	local option="$1"
	tmux show-option -gqv $option
}

set_tmux_option() {
	local option=$1
	local value=$2
	tmux set-option -gq "$option" "$value"
}

update_tmux_option() {
	local option="$1"
	local value="$( get_tmux_option $option )"
	local replace="#($bash_cmd)"
	local new_value="${value//$tmux_cmd/$replace}"
	set_tmux_option "$option" "$new_value"
}

main() {
	update_tmux_option "status-left"
	update_tmux_option "status-right"
}

main
