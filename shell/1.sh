#!/bin/bash

set -ex
test(){ 
	echo "test..." 
}
test
ls $1 || echo 'faild'
test
echo $?

echo 123 && echo {}