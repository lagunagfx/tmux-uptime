# tmux-uptime
A simple tmux plugin that shows very shortly how long the system has been running

## Format strings (add these to your tmux statusbar)

`tmux-uptime` takes its input from the `uptime --pretty` command 

* `#{lgfx_update}`: prints the time the machine has been running.

## Installation with [tmux plugin manager](https://github.com/tmux-plugins/tpm) (recommended)

Add the plugin to the list of TPM plugins in `~/.tmux.conf`:
```
set -g @plugin 'lagunagfx/tmux-uptime'
```
Hit `prefix` + <kbd>I</kbd> to fetch the plugin, then reload your tmux configuration with `prefix` + <kbd>r</kbd>.

Add format strings to `status-left` or `status-right`, where you see fit.

Additionally, you can update the plugin using `prefix` + <kbd>U</kbd> and, when prompted, write `tmux-uptime` and press <kbd>enter</kbd>

## Manual install

Clone this repo:
```
$ git clone https://github.com/lagunagfx/tmux-uptime ~/.tmux/plugins
```
Add this line to the _bottom_ of your `.tmux.conf`:
```
run-shell ~/.tmux/plugins/tmux-uptime/uptime.tmux
```
Reload tmux config using `prefix`+<kbd>r</kbd>, or invoke the action directly from the command line
```
$ tmux source-file ~/.tmux.conf
```
You can update the plugin manually running:
```
$ cd ~/.tmux/plugins/tmux-uptime && git pull
```

# License
[GPL](https://github.com/lagunagfx/tmux-uptime/blob/main/LICENSE)
