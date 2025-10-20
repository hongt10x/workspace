#!/bin/bash

#不能有空格，或者用引号包围起来
case $1,$2 in 
"1,2")echo "$1,$2";;
3,4)echo "$1,$2";;
esac


<<!
$ sh case_more.sh 3 4
3,4
!
