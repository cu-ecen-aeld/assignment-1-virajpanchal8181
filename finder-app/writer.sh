#!/bin/bash

writefile=$1
writedir=${writefile%/*}
writestr=$2

if [ $# -ne 2 ];
then 
  echo "Not all writer arguments supplied"
  exit 1
fi
if [ -d "$writedir" ]
then
    echo "Valid write dir path exists"
    if [ -f "$writefile" ]
    then
      echo "$writestr" > $writefile
      exit 0
    else
      echo "creating a file"
      touch $writefile
      echo "$writestr" > $writefile
      echo "write string is written on the file"
      exit 0
    fi
elif mkdir -p "$writedir" &&  touch "$writefile"
then
    #cd $writedir | touch ${writefile##*/}
    echo "created a new path and file"
    #echo "$writestr" > ${writefile##*/}
    echo "$writestr" > $writefile
    echo "string written"
    exit 0
else
    echo "file path can't be created"
    exit 1
fi
