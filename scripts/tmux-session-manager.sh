#!/bin/bash

SESSIONS=("config" "sicp" "cfd")

session_exists() {
	tmux has-session -t "$1" 2>/dev/null
}

create_or_attach() {
	local session_name="$1"

	if session_exists "$session_name"; then
		echo "Attachiing to existing session: $session_name"
		tmux attach-session -t "$session_name"
	else
		echo "Creating new session: $session_name"
		tmux new-session -s "$session_name"
	fi
}

get_session_options() {
	for session in "${SESSIONS[@]}"; do
		if session_exists "$session"; then
			echo "$session (running)"
		else
			echo "$session (new)"
		fi
	done
}

fzf_session_selector() {
	local selected
	selected=$(get_session_options | fzf --prompt="Select tmux session: " --height=10)
	
	if [ -n "$selected" ]; then
		# Extract session name (remove status info)
		session_name=$(echo "$selected" | cut -d' ' -f1)
		create_or_attach "$session_name"
	else
		echo "No session selected"
		exit 1
	fi
}

get_session_choice() {
	local interface="$1"
	
	case "$interface" in
		"fzf")
			fzf_session_selector
			;;
		"list")
			get_session_options
			;;
		*)
			echo "Usage: get_session_choice [fzf|list]"
			exit 1
			;;
	esac
}

if [ $# -eq 0 ]; then
	# Default to fzf if no arguments
	get_session_choice "fzf"
else
	case "$1" in
		"--list")
			get_session_choice "list"
			;;
		"--session")
			if [ -n "$2" ]; then
				create_or_attach "$2"
			else
				echo "Usage: $0 --session <session_name>"
				exit 1
			fi
			;;
		*)
			get_session_choice "fzf"
			;;
	esac
fi
