# fish-scripts
Fish shell scripts for CachyOS

## Scripts
1. `stc-flash.fish`
Select serial port and HEX file with fzf, burn STC89 51 MCU via stcgal.

Requirements:
- fzf
- stcgal
- python-pipx

Install:
```bash
cp stc-flash.fish ~/.config/fish/functions/

