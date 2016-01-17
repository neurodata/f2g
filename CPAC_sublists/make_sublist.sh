#!/bin/bash
#
# $1 is the text file containing all subject paths with the sessions
#


exec 4<$1

filename=$(basename "$1")
anat_path="/anat_1/anat.nii.gz"
rest_path="/rest_1/rest.nii.gz"
scan=${filename%.txt}
echo -n "" > $scan.yml

while read -r rspath<&4
do
	arr=( $(echo $rspath | tr "/" "\n") )
	subnum=${arr[4]}
	session=${arr[5]}
	rsalt="${rspath/session_*/session_1}"
	if [ -f $rspath$anat_path ] && [ -f $rspath$rest_path ]
		then
			echo "-" >> $scan.yml
			echo "    subject_id: '$subnum'" >> $scan.yml
			echo "    unique_id: '$session'" >> $scan.yml
			echo "    anat: '$rspath$anat_path'" >> $scan.yml
			echo "    rest:" >> $scan.yml
			echo "        rest_1_rest: '$rspath$rest_path'" >> $scan.yml
	elif [ -f $rsalt$anat_path ] && [ -f $rspath$rest_path ]
		then
			echo "-" >> $scan.yml
			echo "    subject_id: '$subnum'" >> $scan.yml
			echo "    unique_id: '$session'" >> $scan.yml
			echo "    anat: '$rsalt$anat_path'" >> $scan.yml
			echo "    rest:" >> $scan.yml
			echo "        rest_1_rest: '$rspath$rest_path'" >> $scan.yml
	fi
			
done 4<$1
