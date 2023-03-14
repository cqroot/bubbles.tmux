# Bubbles Theme for Tmux

## Installation

### Install manually

Clone the repo somewhere and source it in `.tmux.conf`:

```bash
run-shell "/path/to/tmux-power.tmux"
```

NOTE: Options should be set before sourcing.

## Options

| Option         | Default   |
| -------------- | --------- |
| status_justify | centre    |
| modules_left   | ' #S '    |
| modules_right  | ' %F %T ' |
| color_main     | '#BD93F9' |
| color_active   | '#EAEAEA' |
| color_grey     | '#424242' |
| color_light    | '#EAEAEA' |
| color_dark     | '#282A2E' |

## Credits

- [tmux-power](https://github.com/wfxr/tmux-power) - Tmux powerline theme
