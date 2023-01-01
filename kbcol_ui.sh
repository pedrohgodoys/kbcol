#!/bin/bash

# Sanity Check (progress bar)
model=$(g512-led --print-device | awk '{print tolower($4)}')"-led" # find the keyboard model

# Base color
base_color=$(zenity --forms --width 300 --height 150 \
	--title="Quick color selection" --text=" Type a color or left blank to select: " --separator="|" \
	--add-entry="Color (hex; numeric values):" \
	--ok-label="Next")
base_condition=$?
if [[ ${base_condition} -eq 0 ]]
then

if [[ ! -n $base_color ]] 
then
	base_color=$(printf "%02X%02X%02X" $(zenity --color-selection --show-palette | sed -e 's/[rgb\(\)]//gm' -e 's/[\,]/ /gm'))
fi
echo "Base color: ${base_color}."

# Accent color
accent_layout=$(zenity --list \
	--title "Accent layout" \
	--text " Select the accent layout: " \
	--width 700 --height 340 \
	--separator "|" --ok-label "Apply" \
      --radiolist --column "Selection" --column "Highlight layout" --column "Affected keys" \
      TRUE "NVim" "h,j,k,l" \
      FALSE "Indicators" "LED indicator of capslock, numlock and game mode" \
      FALSE "Fkeys" "F1-F12" \
      FALSE "Modifiers" "Ctrl, alt, shitf, ..." \
      FALSE "Arrows" "Up, right, down and left arrows" \
      FALSE "Numpad" "Numeric keyboard" \
      FALSE "Functions" "Esc, home, print screen, ..." \
      FALSE "SixtyKey" "60% keyboard layout (a-z, 0-9, tab, enter, space, backspace ...)" \
      --ok-label="Choose accent color" \
      --cancel-label="None")
layout=$?
case ${layout} in
	0)
		accent_color=$(zenity --forms --width 300 --height 150 \
			--title="Quick color selection" --text=" Type a color or left blank to select: " --separator="|" \
			--add-entry="Accent color (hex; numeric values):" \
			--ok-label="Next")
		#accent_condition=$?
		if [[ ! -n $accent_color ]] 
		then 
			accent_color=$(printf "%02X%02X%02X" $(zenity --color-selection --show-palette | sed -e 's/[rgb\(\)]//gm' -e 's/[\,]/ /gm'))
		fi
		;;
	1)
		accent_layout="None"
		accent_color="None";;
	-1)
		zenity --error --title="Error" --text="An unexpected error accurred :(";;
esac

# Applying colors
zenity --question --width=200 --height=150 \
	--title="Color confirmation" \
	--text="Base color: #${base_color}\nAccent color: #${accent_color}\nAccent layout: ${accent_layout}" \
	--ok-label="Apply"
confirmation=$?
if [[ $confirmation -eq 0 ]]
then
	#Cool progress bar
	(
	echo "15"
	echo "# Applying base color"
	${model} -a ${base_color}
	
	echo "75"
	echo "# Applying accent color"
	if [[ $accent_layout != "None" ]]
	then
		if [[ $accent_layout = "NVim" ]]
		then
			${model} -k h ${accent_color}
			${model} -k j ${accent_color}
			${model} -k k ${accent_color}
			${model} -k l ${accent_color}

		elif [[ $accent_layout = "Indicators" ]]
		then
			${model} -g indicators ${accent_color}
		elif [[ $accent_layout = "Fkeys" ]]
		then
			${model} -g fkeys ${accent_color}
		elif [[ $accent_layout = "Modifiers" ]]
		then
			${model} -g modifiers ${accent_color}
		elif [[ $accent_layout = "Arrows" ]]
		then
			${model} -g arrows ${accent_color}
		elif [[ $accent_layout = "Numpad" ]]
		then
			${model} -g numeric ${accent_color}
		elif [[ $accent_layout = "Functions" ]]
		then
			${model} -g functions ${accent_color}
		else
			${model} -g keys ${accent_color}
		fi
	fi
	echo "100"
	echo "# Finishing"
	) | zenity --progress --title="Applying changes" --percentage=0 --auto-close

fi


fi
