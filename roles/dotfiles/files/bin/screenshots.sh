#!/usr/bin/env bash

# Based on https://stackoverflow.com/a/42266990
today=$(date +%d-%b)
           # 08-Feb_14-57-40.png
for fname in ??-???_??-??-??.png; do
  fname_date=${fname:0:6}
  fname_month=${fname:3:3}
  fdest=$PWD/$fname_month/$fname_date
  [ $today = $fname_date ] && continue;
  [ ! -d $fdest ] && mkdir -p $fdest
  if [ ! -d $fdest ]; then
    echo "Error: Can not create directory $fdest"
    break
  fi
  mv $fname $fname_month/$fname_date
done