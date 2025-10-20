#!/bin/bash

function func1(){
echo "start..."
	echo "func1 ..."
return 0
}


a=$(func1)
echo "a: $a"
func1
b=$?
echo "b: $b"
