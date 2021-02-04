#!/usr/bin/env bash

psgrep=$(ps ax | grep -v grep | grep cmus | cut -d" " -f9 | xargs)

if [ $psgrep == "cmus" ]; then
  /usr/bin/cmus-remote "$@"
else
  cmus &
