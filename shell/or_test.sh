#!/bin/bash

echo "1: $1"
eval echo "2: $1"
if [ -f $(eval echo $1) ];then
	echo 'find'
else
	echo 'cannot find'
fi

