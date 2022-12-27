#!/bin/bash
g512-led -a $(printf "%02X%02X%02X" $(zenity --color-selection --show-palette | sed -e 's/[rgb\(\)]//gm' -e 's/[\,]/ /gm'))
