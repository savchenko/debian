#!/usr/bin/env bash

if [ $# -eq 3 ]; then
  executable=$(which "$1")
  if [[ ! -x $executable ]]; then
    echo -e "\n1st argument is not an executable.\n"
    exit 1
  fi
  if [ -n "$2" ] && [ "$2" -eq "$2" ]; then
    if [ -n "$3" ] && [ "$3" -eq "$3" ]; then
      :
    else
      echo -e "\n2nd or 3rd parameter is not an integer.\n"
      exit 1
    fi
  fi
  if [[ $2 -lt 1 ]] || [[ $3 -lt 1 ]]; then
    echo -e "\nSupplied numbers don't make sense.\n"
    exit 1
  fi
else
  echo -e "\nUsage: recycler.sh /path/to/executable sec_to_wait_before_kill repetitions\n"
  exit 1
fi

red='\033[0;31m'
green='\033[0;32m'
clr='\e[0m'
start=$(date +%s)

killer() {
  for ((n=1;n<=$3;n++)); do
    sleep "$2"
    runtime=$( echo "$(date +%s) - $start" | bc -l )
    echo -e "${red}Kill #$n/$3 at ${runtime}s.${clr}"
    pkill --full --exact $1
done
}

launcher() {
  for ((n=1;n<=$3;n++)); do
    if [[ $n -gt 1 ]]; then
      sleep "$2"
    fi
    runtime=$( echo "$(date +%s) - $start" | bc -l )
    echo -e "${green}Spawn #$n/$3 at ${runtime}s.${clr}"
    sleep 0.1 && $1 # cheap anti-race-condition
done
}

killer "$@" &
launcher "$@" &
wait < <(jobs -p)
