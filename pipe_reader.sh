#!/bin/bash

set -o pipefail

pipe=/tmp/testpipe

if [[ ! -p $pipe ]]; then
    echo "Reader not running"
    exit 1
fi

while true 
do
    if read line <$pipe; then
		exec $line
    fi
done

