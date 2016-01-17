#!/bin/bash

exec 3<$1
exec 4<$2
COUNTER=0
while read -r line1<&3 && read -r line2<&4; do
	#if [ ! -f $line2 ]; then
		python npz2graphml.py $line1 $line2
		let COUNTER=$COUNTER+1
		echo $COUNTER
	#fi
done 3<$1 4<$2 
