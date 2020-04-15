#!/bin/bash

pipe=/tmp/testpipe

trap "rm -f $pipe" EXIT

if [[ ! -p $pipe ]]; then
    mkfifo $pipe
fi

./pipe_reader.sh &

docker build ./image/ -t pipe_test && docker run -it --rm -v /tmp/testpipe:/tmp/testpipe -v --privileged pipe_test $@



