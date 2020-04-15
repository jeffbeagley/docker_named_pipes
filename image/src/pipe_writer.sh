#!/bin/sh

pipe=/tmp/testpipe

if [[ ! -p $pipe ]]; then
    echo "Reader not running"
    exit 1
fi

if [[ "$1" ]]; then
    echo "$@" >> $pipe
else
    echo "Hello from $$" >$pipe
fi