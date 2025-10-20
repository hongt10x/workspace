#!/bin/bash


until [ -n "$1" ]; do
	if [ "$1"x == '1'x ];then
		printf '\n\t good ...'
	else
		printf '\n\t bad ...'
		
	fi
	break
done
printf '\n\t end...'
