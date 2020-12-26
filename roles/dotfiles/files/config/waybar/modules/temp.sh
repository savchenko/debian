#!/bin/bash

set -o errexit
set -o nounset

echo $(curl -s wttr.in/Adelaide?format="+%t" | cut -b 3-6)
