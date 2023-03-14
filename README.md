# Bubbles Theme for Tmux

![bubbles.tmux](https://user-images.githubusercontent.com/46901748/225083037-fdb93561-037f-432a-bc44-1b309d365216.png)

## Requirements

- [Nerd Font](https://www.nerdfonts.com/)

## Installation

### Install manually

Clone the repo somewhere and source it in `.tmux.conf`:

```bash
run-shell "/path/to/bubbles.tmux"
```

## Options

The default main color is inspired by [dracula](https://draculatheme.com/). You can modify it with the following command:

```bash
set -g @tmux_bubbles_color_main '#76bddb'
```

Here are all the options:

| Option                     | Default     |
| -------------------------- | ----------- |
| tmux_bubbles_modules_left  | `' #S '`    |
| tmux_bubbles_modules_right | `' %F %T '` |
| tmux_bubbles_color_main    | `'#BD93F9'` |
| tmux_bubbles_color_active  | `'#EAEAEA'` |
| tmux_bubbles_color_grey    | `'#424242'` |
| tmux_bubbles_color_light   | `'#EAEAEA'` |
| tmux_bubbles_color_dark    | `'#282A2E'` |

**NOTE**: Options should be set before sourcing.

## Credits

- [tmux-power](https://github.com/wfxr/tmux-power) - Tmux powerline theme
