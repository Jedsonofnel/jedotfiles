#!/bin/bash

# Base directories to search for projects (will search inside these)
SEARCH_DIRS=(
	"$HOME/Documents/JEDN-Codes"
)

# Specific directories to include directly (won't search inside these)
DIRECT_DIRS=(
	"$HOME/Documents/jedotfiles"
)

if [[ $# -eq 1 ]]; then
	selected=$1
else
	# Get subdirectories from search dirs
	search_results=""
	if [[ ${#SEARCH_DIRS[@]} -gt 0 ]]; then
		search_results=$(fd . "${SEARCH_DIRS[@]}" --type=dir --max-depth=1 --full-path --base-directory $HOME | sed "s|^$HOME/||")
	fi
	
	# Get direct directories  
	direct_results=""
	for dir in "${DIRECT_DIRS[@]}"; do
		if [[ -d "$dir" ]]; then
			if [[ "$dir" == "$HOME" ]]; then
				direct_results="$direct_results~"$'\n'
			else
				direct_results="$direct_results${dir#$HOME/}"$'\n'
			fi
		fi
	done
	
	# Combine and select with fzf
	selected=$(printf "%s\n%s" "$search_results" "$direct_results" \
		| grep -v '^$' \
		| sort -u \
		| fzf --prompt="Select project: " --tmux center,60%,60% --style minimal --layout reverse )
	
	# Convert back to full path
	if [[ $selected == "~" ]]; then
		selected="$HOME"
	elif [[ -n $selected ]]; then
		selected="$HOME/$selected"
	fi
fi

# Exit if nothing selected
[[ ! $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _ | tr '[:upper:]' '[:lower:]')

if ! tmux has-session -t "$selected_name" 2>/dev/null; then
	tmux new-session -ds "$selected_name" -c "$selected"
fi

if [[ -n $TMUX ]]; then
	tmux switch-client -t "$selected_name"
else
	tmux attach-session -t "$selected_name"
fi
