#### Most of this will be overriden by powerline

# The modes {{{
setw -g clock-mode-colour colour135
setw -g mode-attr bold
setw -g mode-fg colour6
setw -g mode-bg colour238
#}}}

# The panes {{{
set -g pane-border-bg colour235
set -g pane-border-fg colour238
set -g pane-active-border-fg colour51
set -g pane-active-border-bg colour51
# }}}

# The statusbar {{{
set -g status-position bottom
set -g status-left ''
set -g status-interval 2
set -g status-justify left
if-shell '. ~/.bash_customs && [ -n "$LIGHT_THEME" ] && $LIGHT_THEME'\
	'set -g status-bg colour255;\
	 set -g status-right "#[fg=colour233,bg=colour251,bold] %d/%m #[fg=colour233,bg=colour253,bold] %H:%M:%S "'\
	'set -g status-bg colour234;\
	 set -g status-right "#[fg=colour233,bg=colour241,bold] %d/%m #[fg=colour233,bg=colour245,bold] %H:%M:%S "'
set -g status-right-length 50
set -g status-left-length 20

# Window tabs {{{
setw -g window-status-current-attr dim
setw -g window-status-bg green
setw -g window-status-fg black
setw -g window-status-attr reverse


setw -g window-status-current-attr bold
setw -g window-status-attr none
if-shell '. ~/.bash_customs && [ -n "$LIGHT_THEME" ] && $LIGHT_THEME'\
	'setw -g window-status-bg colour248 ;\
	 setw -g window-status-current-bg colour253 ;\
	 setw -g window-status-current-format " #I#[fg=colour239]:#[fg=colour232]#W#[fg=colour33]#F " ;\
	 setw -g window-status-format " #I#[fg=colour233]:#[fg=colour233]#W#[fg=colour239]#F "'\
	\
	'setw -g window-status-bg colour235 ;\
	 setw -g window-status-current-bg colour238 ;\
	 setw -g window-status-current-format " #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F " ;\
	 setw -g window-status-format " #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F "'



setw -g window-status-bell-attr bold
setw -g window-status-bell-fg colour255
setw -g window-status-bell-bg colour1
# }}}
# }}}

# The messages {{{
set -g message-attr bold
set -g message-fg colour232
set -g message-bg colour166
# }}}

# Powerline {{{
# This is totally a hack, but it allows me to keep everything inside this file. Basically this
# horrific line finds powerline's bindings directory and makes tmux source the correct one
run-shell '[ -z $POWERLINE_DISABLE ] || exit 0;\
powerline_root=$(python2 -c "from powerline.config import POWERLINE_ROOT; print (POWERLINE_ROOT)" 2>/dev/null);\
[ -n "$powerline_root" ] || powerline_root=$(python -c "from powerline.config import POWERLINE_ROOT; print (POWERLINE_ROOT)" 2>/dev/null);\
[ -f "$powerline_root/powerline/bindings/tmux/powerline.conf" ] && tmux source "$powerline_root/powerline/bindings/tmux/powerline.conf"'

# }}}

# vim: fdm=marker ft=tmux
