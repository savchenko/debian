#!/usr/bin/env bash
#
# Naive and fast search for questionable data.
# This won't defeat even the simplest obfuscation,
# but useful to find an (un)intentially left artefacts
#
set -o pipefail

if [ -z "$1" ]; then
    fpath=$PWD
  elif [[ -d "$1" ]] && [[ -r "$1" ]] && [[ -x "$1" ]]; then
    fpath="$1"
  else
    echo "ERROR: Target directory can't be traversed."
    exit 126
fi

rgx_ips='"(?:[0-9]{1,3}\.){3}[0-9]{1,3}"'
fn_full=(curl www http wget aria2c passwd password crypt sha1 md5 rc4 arcfour tls ftp ssl GET $rgx_ips)
fnames=(curl www http wget aria2c tls GET $rgx_ips)
fnames_list=$(printf "|%s" "${fnames[@]}")
fnames_list="${fnames_list:1}"

for fname in "${fnames[@]}"; do
  cmd="rg --no-column --hidden --color never --no-line-number --heading --smart-case \
       -g !$(basename $0)* -g !*~ -g !.git/ -g !*.txt -g!*.md $fname $PWD | \
       rg -v '^\s*[\"\#]' | \
       rg --color always -U -v '^[[:punct:]]\w+.*\n^\s*$' | rg -v '^\s*$' | \
       ack --noenv --flush --break --color --color-match='underline bold green' \
       --passthru '$fnames_list|${rgx_ips:1:-1}'"
  eval $cmd;
done
