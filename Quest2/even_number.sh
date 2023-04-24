#! /bin/bash

for i in {1..100}
do
	x=$((i & 1))
	if [ "$x" -eq 0 ]
	then
		echo "$i"
	fi
done
