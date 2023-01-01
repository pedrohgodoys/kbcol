# Keyboard color chooser

## Description

This is a simple and highly scalable script, built with [zenity (3.43.0)](https://help.gnome.org/users/zenity/stable/index.html.en) and bash (`kbcol_ui.sh`), manage Logitech's keyboard-LEDs (compatible models: G213, G410, G413, G512, G513, G610, G810, G815, G910, and GPRO). The most straightforward way I found possible was by using the [dioni21/g810-led](https://github.com/dioni21/g810-led/) repo forked from [MatMoul/g810-led](https://github.com/MatMoul/g810-led) as command-line led controller, associated with a clever idea from [Nicholas Berlette](https://github.com/nberlette) at [GithubGist](https://gist.github.com/nberlette/e3e303a81f2c41927bf4fe90fb89d97f) to a simple RGB to HEX conversion.

Remember tt change the file permission to executable by `sudo chmod +x <file_name>.sh`, and it can be added to your `$PATH` at `$HOME/.local/bin` or `/usr/local/bin/`. Alternatively, if you want to cut everything and easily select a color for the whole keyboard, use the `shorter_kbcol.sh` script. It can be added to the `$PATH` as well or to a quick keyboard shortcut.
