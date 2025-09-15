#!/bin/bash

# Base directories to search for projects (will search inside these)
SEARCH_DIRS=(
	"$HOME/Documents/JEDN-Codes"
)

# Specific directories to include directly (won't search inside these)
DIRECT_DIRS=(
	"$HOME/Documents/jedotfiles"
)

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

# Tofi options for centered, max-width appearance
TOFI_OPTS=(
	--prompt-text="Select project: "
	--width=100%
	--height=100%
	--border-width=0
	--outline-width=0
	--padding-left=35%
	--padding-top=35%
	--result-spacing=25
	--num-results=5
	--font="/usr/share/fonts/TTF/IosevkaNerdFont-Medium.ttf"
	--selection-color=#407ee7
	--text-color=#f1efee
	--background-color=#000A
)

# Combine and select with tofi
selected=$(printf "%s\n%s" "$search_results" "$direct_results" \
	| grep -v '^$' \
	| sort -u \
	| tofi "${TOFI_OPTS[@]}")

[[ ! $selected ]] && exit 0

if [[ $selected == "~" ]]; then
	selected="$HOME"
else
	selected="$HOME/$selected"
fi

selected_name=$(basename "$selected" | tr . _ | tr '[:upper:]' '[:lower:]')

TERMINAL=${TERMINAL:-${TERM_PROGRAM:-ghostty}}

if tmux has-session -t "$selected_name" 2>/dev/null; then
	$TERMINAL -e tmux attach-session -t "$selected_name" &
else
	$TERMINAL -e tmux new-session -s "$selected_name" -c "$selected" &
fi
