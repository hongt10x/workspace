#!/bin/bash


a=1
name() {
echo "function is 'name()' ..."
}

name


function age() {
echo "function is 'function age()' ..."
}
age

function good {
echo "function is 'function good' ..."
local a=100
echo "good 's a-> $a"
}

good
echo "global a: $a"



#下面是错误定义方式
good {
echo "function is 'good' ..."
local a=100
echo "good 's a-> $a"
}
