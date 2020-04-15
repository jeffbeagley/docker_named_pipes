#!/bin/bash

file=commands.txt
touch $file

docker build ./image/ -t pipe_test && docker run -it --rm --name=pipe_test -v $(pwd)/$file:/tmp/$file pipe_test $@

#now commands are added to commands.txt from container, lets read them in and execute them
while IFS= read -r line
do
  $line
done < $file








