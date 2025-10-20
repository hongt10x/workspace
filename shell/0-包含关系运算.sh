#!/bin/bash

A="helloworld"
B="low"

if [[ $A == *${B}* ]];then
	echo "A包含B"
else
	echo "A不包含B"
fi

echo "+++++++++++++++"

if [[ $A =~ ${B} ]];then
	echo "A包含B"
else
	echo "A不包含B"
fi
