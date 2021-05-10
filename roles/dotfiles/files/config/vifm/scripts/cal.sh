#!/usr/bin/env bash

get_suffix() {
  case `date +%d` in
    1|21|31) echo "st";;
    2|22)    echo "nd";;
    3|23)    echo "rd";;
    *)       echo "th";;
  esac
}
suffix=$(get_suffix)
columns=$(tput cols)
title=$(date +%A,\ %d$suffix\ of\ %B)

if [[ $# -eq 1 && ${1%} == 'clear' ]]; then
  quote="$(fortune -e st.txt)"
  quote=$(printf "$quote\n\n")
  clear -x
else
  :
fi

echo ''
printf "%*s\n" $(((${#title}+$columns)/2)) "$title" && echo ''

# Display 3 months, "old style" output, start on Monday, highlight today
ncal -3 -b -M
if [ ! -z "$quote" ]; then read -n 1 -s -p "$quote"; fi
