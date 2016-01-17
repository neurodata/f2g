#!/bin/bash
#
# Inputs
#	$1: the file containing the paths to the npzfiles
#	$2: the folder containing the destination

exec 4<$1

while read -r line1<&4
do
	arr=( $(echo $line1 | tr "/" "\n") )
	pipe=${arr[4]}
	subject=${arr[5]}
	pipekey="pipeline_abide_run"
	antskey="__ANTS"
	scrubkey="__scrub"
	freqkey="__freq-filter"
	if [[ "$line1" == *"ANT"* ]]; then
		preopt="ANT"
	else
		preopt="FSL"
	fi		

	if [[ "$line1" == *"scrub"* ]]; then
		scropt="scr"
	else
		scropt="nsc"
	fi

	if [[ "$line1" == *"freq-filter"* ]]; then
		fropt="frf"
	else
		fropt="nff"
	fi

	if [[ "$line1" == *"CC200"* ]]; then
		atopt="cc2"
	elif [[ "$line1" == *"desikan"* ]]; then
		atopt="des"
	elif [[ "$line1" == *"ho_mask"* ]]; then
		atopt="hox"
	elif [[ "$line1" == *"aal_mask"* ]]; then
		atopt="aal"
	fi

	if [[ "$line1" == *"global1"* ]]; then
		gsopt="gsr"
	else
		gsopt="ngs"
	fi

	uniqpath="${preopt}_${fropt}_${scropt}_${gsopt}_${atopt}"

	mkdir -p $2$uniqpath

        cp $line1 $2$uniqpath/${subject}.npz
	

done 4<$1
