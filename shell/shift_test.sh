#!/bin/bash

#echo "参数：$* ,总数：$#"
while [ $# -ne 0 ]
do

	echo "参数：$* ,总数：$#"
	echo "参数：$1 ,总数：$#"
	shift 2
	if [ $# -eq 1 ];then
		break
	fi
done

