#!/usr/bin/env bash
#
# ALSA card/device switcher
# Andrew Savchenko (c) MIT
# andrew@savchenko.net
#
IFS=
cards_list="$(aplay -l | grep ^card | sed -r 's/^card\s([0-9].*:\s.*)\s\[.*/Card\ \1/')"
cards_count="$(echo $cards_list | cut -d":" -f1 | cut -d" " -f2 | uniq | wc -l)"
if [ $cards_count -lt 10 ]; then
  choice=$(echo $cards_list | wofi -L 6 -W 600 -i -b -d -p 'Audiocards' -O 'alphabetical')
  asoundrc="$HOME/.asoundrc"
  if [[ ! -z "$choice" ]]; then
    card=$(echo $choice | cut -d":" -f1 | rev | cut -b1)
    device=$(echo $choice | cut -d":" -f2 | rev | cut -b1)
    description=$(echo $choice | sed -r 's/(^.*\[)(.*)(\].*)/\2/')
    grep -E -q 'card\s[0-9]' $asoundrc && sed -r -i "s/(card\s)[0-9]/\1$card/g" $asoundrc
    grep -E -q 'device\s[0-9]' $asoundrc && sed -r -i "s/(device\s)[0-9]/\1$device/g" $asoundrc
    if [ $? -eq 0 ]; then
      sudo alsaucm reload
    fi
    if [[ -n "$TERM" && -n "$COLORTERM" ]]; then
      echo "Switching to card #$card and device #$device ($description)"
    else
      notify-send "$description" "Switching to card #$card and device #$device"
    fi
  else
    :
  fi
fi
