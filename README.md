# Keyboard color chooser

## Description
This is a simple and highly scaleble bash script to choose change Logitech's keyboard led colors (models G213, G410, G413, G512, G513, G610, G810, G815, G910 and GPRO) in Gnome Environment. The idea is to associate this executable script to a keyboard shortcut to easy change the led color. Also, after turn it into an executable (`sudo chmod +x kbcol.sh`), can be added in your `$PATH` at `$HOME/.local/bin` or `/usr/local/bin/`. 

In order to do that, in the simpler way possible, the [dioni21/g810-led](https://github.com/dioni21/g810-led/) repo forked from [MatMoul/g810-led](https://github.com/MatMoul/g810-led) was used as command-line led controller, associated with a clever idea from [Nicholas Berlette](https://github.com/nberlette) at [GithubGist](https://gist.github.com/nberlette/e3e303a81f2c41927bf4fe90fb89d97f), and simple regex.

**Code:**
```bash
#!/bin/bash
g512-led -a $(printf "%02X%02X%02X" $(zenity --color-selection --show-palette | sed -e 's/[rgb\(\)]//gm' -e 's/[\,]/ /gm'))
```
> **Reminder:** _change the `g512-led` to your model ([as shown here](https://github.com/MatMoul/g810-led#help-)) so it can actually change the color._
