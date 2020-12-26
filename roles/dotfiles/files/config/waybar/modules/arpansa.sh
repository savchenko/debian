#!/bin/bash

set -o errexit
set -o nounset

rawxml=$(curl -s https://uvdata.arpansa.gov.au/xml/uvvalues.xml)
uvindex=$(xmllint --xpath '/stations/location[@id="Adelaide"]/index/text()' - <<< "$rawxml" | cut -b 1-4)
echo "$uvindex"
