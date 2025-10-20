#!/bin/bash

count=0
for str in 'this is a string.'
do
	count=$((++count))
	#let count++
	echo $str
	echo $count
done

