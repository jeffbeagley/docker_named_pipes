#!/bin/sh

pipe=/tmp/commands.txt

if [[ "$1" ]]; then
    echo "$@" > $pipe
else
    echo "Hello from $$" >$pipe
fi