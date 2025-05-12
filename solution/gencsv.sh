#!/bin/bash

start=$1
end=$2

> inputFile

for i in $(seq $start $end); do
  rand=$((RANDOM % 1000))  
  echo "$i, $rand" >> inputFile
done
