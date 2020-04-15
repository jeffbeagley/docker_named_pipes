#!/bin/bash

while true
do
	echo "test" >> test.txt
    if read line < test.txt; then
		docker ps
    fi
done