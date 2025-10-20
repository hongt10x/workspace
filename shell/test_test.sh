#!/bin/bash


read age
if test $age -le 2;then
	echo '<=2'
elif test $age -gt 3;then
	echo ">3"
fi

if [ "$age" > "2" ];then
	echo '>2'
else
	echo 'bye'
fi

