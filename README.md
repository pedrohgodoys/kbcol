# Keyboard color chooser

## Description
This is a simple and highly scalable bash script to choose Logitech's keyboard-led colors in Gnome Environment (compatible models: G213, G410, G413, G512, G513, G610, G810, G815, G910, and GPRO). The idea is to associate this executable script to a keyboard shortcut to easily change the led color. Also, after turning it into an executable (`sudo chmod +x kbcol.sh`), it can be added to your `$PATH` at `$HOME/.local/bin` or `/usr/local/bin/`. 

To do that, in the most straightforward way possible, the [dioni21/g810-led](https://github.com/dioni21/g810-led/) repo forked from [MatMoul/g810-led](https://github.com/MatMoul/g810-led) was used as command-line led controller, associated with a clever idea from [Nicholas Berlette](https://github.com/nberlette) at [GithubGist](https://gist.github.com/nberlette/e3e303a81f2c41927bf4fe90fb89d97f), and simple regex.
