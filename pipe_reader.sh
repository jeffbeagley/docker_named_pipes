#!/bin/bash

pipe=/tmp/testpipe

if [[ ! -p $pipe ]]; then
    echo "Reader not running"
    exit 1
fi

while true
do
    if read line <$pipe; then
        echo $line
		exit 1
    fi
done
