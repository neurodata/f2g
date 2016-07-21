#!/bin/bash

echo -n "" >> hcp_sublist.yml

while read -r sub; do

    rlpath=/home/ubuntu/Documents/inputs/$sub/session_RL
    lrpath=/home/ubuntu/Documents/inputs/$sub/session_LR
    anatpath=/home/ubuntu/Documents/inputs/$sub/anat_1

    rlfile=$rlpath/rest_rl.nii.gz
    lrfile=$lrpath/rest_lr.nii.gz
    anatfile=$anatpath/anat.nii.gz
    echo "
    mkdir -p $rlpath $lrpath $anatpath
    s3cmd get s3://hcp-openaccess/HCP/$sub/unprocessed/3T/tfMRI_LANGUAGE_RL/${sub}_3T_tfMRI_LANGUAGE_RL.nii.gz $rlfile
    s3cmd get s3://hcp-openaccess/HCP/$sub/unprocessed/3T/tfMRI_LANGUAGE_LR/${sub}_3T_tfMRI_LANGUAGE_LR.nii.gz $lrfile
    s3cmd get s3://hcp-openaccess/HCP/$sub/unprocessed/3T/T1w_MPR1/${sub}_3T_T1w_MPR1.nii.gz $anatfile
    "
    echo "-" >> hcp_sublist.yml
    echo "    subject_id: '$sub'" >> hcp_sublist.yml
    echo "    unique_id: 'RL'" >> hcp_sublist.yml
    echo "    anat: '$anatfile'" >> hcp_sublist.yml
    echo "    rest: " >> hcp_sublist.yml
    echo "        rest_1_rest: '$rlfile'" >> hcp_sublist.yml
    echo "-" >> hcp_sublist.yml
    echo "    subject_id: '$sub'" >> hcp_sublist.yml
    echo "    unique_id: 'LR'" >> hcp_sublist.yml
    echo "    anat: '$anatfile'" >> hcp_sublist.yml
    echo "    rest: " >> hcp_sublist.yml
    echo "        rest_1_rest: '$lrfile'" >> hcp_sublist.yml

done < <(cat $1)
