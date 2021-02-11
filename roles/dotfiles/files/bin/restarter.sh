#!/usr/bin/env bash

if [ $# -eq 2 ]; then
  executable=$(which "$1")
  if [[ ! -x $executable ]]; then
    echo -e "\n1st argument is not an executable.\n"
    exit 1
  fi
  if [ -n "$2" ] && [ "$2" -eq "$2" ]; then
    :
  else
    echo -e "\n2nd is not an integer.\n"
    exit 1
  fi
  if [[ $2 -lt 2 ]]; then
    echo -e "\nSupplied number don't make sense.\n"
    exit 1
  fi
else
  echo -e "\nUsage: restarter.sh /path/to/executable how_many_times_to_restart\n"
  exit 1
fi

green='\033[0;32m'
clr='\e[0m'
start=$(date +%s)

restarter() {
  for ((n=1;n<=$2;n++)); do
    runtime=$( echo "$(date +%s) - $start" | bc -l )
    echo -e "${green}Restart #$n/$3 at ${runtime}s.${clr}"
    $1
done
}

restarter "$@"
wait < <(jobs -p)
