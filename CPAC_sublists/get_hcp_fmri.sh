#!/bin/bash

scan="sublist"

echo -n "" > $scan.yml

session=$1

for i in `cat restfiles.txt`; do
    echo "$i"
    echo "$session"
    anat='/home/ubuntu/Documents/inputs/'$session'/'$i'/anat/'$i'_3T_T1w_MPR1.nii.gz'
    echo "$anat"
        if [ -f $anat ]; then
	    if [ -f '/home/ubuntu/Documents/inputs/'$session'/'$i'/rest/'$i'_3T_rfMRI_REST1_RL.nii.gz' ]; then 
		fmri='/home/ubuntu/Documents/inputs/'$session'/'$i'/rest/'$i'_3T_rfMRI_REST1_RL.nii.gz'
		echo "$fmri"
	        uniq="rest1RL"
		echo "-" >> $scan.yml
		echo "    subject_id: '$i'" >> $scan.yml
		echo "    unique_id: '$uniq'" >> $scan.yml
		echo "    anat: '$anat'" >> $scan.yml
		echo "    rest:" >> $scan.yml
		echo "        rest_1_rest: '$fmri'" >> $scan.yml
	    fi
	    if [ -f '/home/ubuntu/Documents/inputs/'$session'/'$i'/rest/'$i'_3T_rfMRI_REST1_LR.nii.gz' ]; then 
		fmri='/home/ubuntu/Documents/inputs/'$session'/'$i'/rest/'$i'_3T_rfMRI_REST1_LR.nii.gz'
		uniq="rest1LR"
		echo "-" >> $scan.yml
		echo "    subject_id: '$i'" >> $scan.yml
		echo "    unique_id: '$uniq'" >> $scan.yml
		echo "    anat: '$anat'" >> $scan.yml
		echo "    rest:" >> $scan.yml
		echo "        rest_1_rest: '$fmri'" >> $scan.yml
	    fi
	    if [ -f '/home/ubuntu/Documents/inputs/'$session'/'$i'/rest/'$i'_3T_rfMRI_REST2_RL.nii.gz' ]; then 
		fmri='/home/ubuntu/Documents/inputs/'$session'/'$i'/rest/'$i'_3T_rfMRI_REST2_RL.nii.gz'
		uniq="rest2RL"
		echo "-" >> $scan.yml
		echo "    subject_id: '$i'" >> $scan.yml
		echo "    unique_id: '$uniq'" >> $scan.yml
		echo "    anat: '$anat'" >> $scan.yml
		echo "    rest:" >> $scan.yml
		echo "        rest_1_rest: '$fmri'" >> $scan.yml
	    fi
	    if [ -f '/home/ubuntu/Documents/inputs/'$session'/'$i'/rest/'$i'_3T_rfMRI_REST2_LR.nii.gz' ]; then 
		fmri='/home/ubuntu/Documents/inputs/'$session'/'$i'/rest/'$i'_3T_rfMRI_REST2_LR.nii.gz'
		uniq="rest2LR"
		echo "-" >> $scan.yml
		echo "    subject_id: '$i'" >> $scan.yml
		echo "    unique_id: '$uniq'" >> $scan.yml
		echo "    anat: '$anat'" >> $scan.yml
		echo "    rest:" >> $scan.yml
		echo "        rest_1_rest: '$fmri'" >> $scan.yml
	    fi
	fi
done

