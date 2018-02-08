#!/bin/bash
export GROUPID=demorg
export BATCHID=matlabb
az batch account login -g $GROUPID -n $BATCHID

JOBI=D$1
filename=drosophila_00-49

for k in {1..2}; do
	for j in {0..9}; do
	  echo "Downloading ${filename}0${j}.tiff from task_${k} ..."
	  az batch task file download --job-id $JOBID --task-id task_${k} --file-path wd/${filename}0${j}.tiff --destination ~/ilastikresults/${k}/${filename}0${j}.tiff 
	 done
	for j in {10..49}; do
	  echo "Downloading ${filename}${j}.tiff from task_${k} ..."
	  az batch task file download --job-id $JOBID --task-id task_${k} --file-path wd/${filename}${j}.tiff --destination ~/ilastikresults/${k}/${filename}${j}.tiff 
	 done
done	 
echo "done."

#AZ_BATCH_NODE_SHARED_DIR
