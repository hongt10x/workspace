#!/bin/bash


IFS_OLD=$IFS

#IFS='\n'
echo $IFS
for line in $(cat 1.log)
do
	echo $line
done

IFS=$IFS_OLD

exit 0
