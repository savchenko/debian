battery_status=$(cat /sys/class/power_supply/BAT0/status | cut -b1-2)
battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
loadavg_5min=$(cat /proc/loadavg | awk -F ' ' '{print $2}')
network=$(ip route get 1.1.1.1 | grep -Po '(?<=dev\s)\w+' | cut -f1 -d ' ')
wlan=$(iwctl station wlan0 show | grep Connected | cut -d" " -f 17)
date_time=$(date "+%a, %d %h - %H:%M")

echo "$loadavg_5min | $wlan | $date_time | $battery_capacity"
