#!/bin/bash
model=$(g512-led --print-device | awk '{print tolower($4)}')"-led" # find the keyboard model
RGB=$(zenity --color-selection --show-palette | sed -e 's/[rgb\(\)]//gm' -e 's/[\,]/ /gm') # colour selection
[[ ! -z $RGB ]] && $model -a $(printf "%02X%02X%02X" ${RGB}) # applying colour

