# tmux-uptime
A simple tmux plugin that shows very shortly how long the system has been running

## Format strings (add these to your tmux statusbar)

* `#{lgfx_update}`: prints the time the machine has been running, based on the `uptime --pretty` command

## Installation with [tmux plugin manager](https://github.com/tmux-plugins/tpm) (recommended)

Add the plugin to the list of TPM plugins in `~/.tmux.conf`:
```
set -g @plugin 'lagunagfx/tmux-uptime'
```
Hit `prefix + i` to fetch the plugin, then reload your tmux configuration with `prefix + r`.

Add format strings to `status-left` or `status-right`, where you see fit.

## Manual install

Clone this repo:
```
$ git clone https://github.com/lagunagfx/tmux-uptime ~/.tmux/plugins
```
Add this line to __the bottom__ of your `.tmux.conf`:
```
run-shell ~/.tmux/plugins/tmux-uptime/uptime.tmux
```
Reload tmux config using `prefix + r`, or invoke the action directly from the command line
```
$ tmux source-file ~/.tmux.conf
```
You can update the plugin manually running:
```
$ cd ~/.tmux/plugins/tmux-uptime && git pull
```

# License
[GPL](https://github.com/lagunagfx/tmux-uptime/blob/main/LICENSE)
