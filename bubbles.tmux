#!/usr/bin/env bash

# $1: option
# $2: default value
tmux_get() {
	local value
	value="$(tmux show -gqv "$1")"
	[ -n "$value" ] && echo "$value" || echo "$2"
}

# *********************************************************
# Options                                                 *
# *********************************************************
status_justify="$(tmux_get @tmux_bubbles_status_justify centre)"
modules_left="$(tmux_get @tmux_bubbles_modules_left ' #S ')"
modules_right="$(tmux_get @tmux_bubbles_modules_right ' %F %T ')"
color_main=$(tmux_get @tmux_bubbles_color_main '#BD93F9')
color_active=$(tmux_get @tmux_bubbles_color_active '#EAEAEA')
color_grey=$(tmux_get @tmux_bubbles_color_grey '#424242')
color_light=$(tmux_get @tmux_bubbles_color_light '#EAEAEA')
color_dark=$(tmux_get @tmux_bubbles_color_dark '#282A2E')

# *********************************************************
# Status                                                  *
# *********************************************************
tmux set-option -gq status-justify "$status_justify"
tmux set-option -gq status-interval 1
tmux set-option -gq status on
tmux set-option -gq status-fg "$color_light"
tmux set-option -gq status-bg "0"
tmux set-option -gq status-attr none

# $1: modules
# $2: fg_color
# $3: bg_color
make_bubble() {
	echo "#[fg=$3]#[bg=0]#[fg=$2]#[bg=$3]$1#[fg=$3]#[bg=0]"
}

# $1: modules
make_activatable_bubble() {
	local normal_bubble
	local active_bubble
	normal_bubble="$(make_bubble "$1" "$color_dark" "$color_main")"
	active_bubble="$(make_bubble "$1" "$color_dark" "$color_active")"

	echo "#{?client_prefix,$active_bubble,$normal_bubble}"
}

tmux set-option -gq status-left "$(make_activatable_bubble "$modules_left")"
tmux set-option -gq status-right "$(make_activatable_bubble "$modules_right")"

tmux set-option -gq status-left-fg "$color_light"
tmux set-option -gq status-left-bg "0"
tmux set-option -gq status-left-length 150
tmux set-option -gq status-right-fg "$color_light"
tmux set-option -gq status-right-bg "0"
tmux set-option -gq status-right-length 150

# *********************************************************
# Window                                                  *
# *********************************************************
tmux set-option -gq window-status-format ' #I #W'
tmux set-option -gq window-status-current-format ' #I #W'

tmux set-option -gq window-status-format "#[fg=$color_light,bg=0,bold] #I:#W#F "
tmux set-option -gq window-status-current-format "$(make_bubble ' #I:#W#F ' "$color_light" "$color_grey")"

# *********************************************************
# Others                                                  *
# *********************************************************
tmux set-option -gq mode-style "bg=$color_main,fg=0"
tmux set-option -gq pane-active-border-style "fg=$color_main,bg=0"
