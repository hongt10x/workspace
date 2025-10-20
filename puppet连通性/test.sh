#!/bin/bash


function generate_randNum(){
	#冒泡排序
	local rand_arr=($*)
	length=${#rand_arr[*]}
	for ((i=1;i<$length;i++))
	do
		for ((j=0;j<$length-$i;j++))
		do
			left=${rand_arr[$j]}
			k=$[$j + 1]
			right=${rand_arr[$k]}
			if [ $left -gt $right ];then
				tmp=$left
				rand_arr[$j]=$right
				rand_arr[$k]=$tmp
			fi
		done
	done
	echo "数组从小到大排序为：${rand_arr[*]}"
	echo "${rand_arr[*]}"
	#return ${rand_arr[*]}
}


new_rand_arr=()
for ((y=0;y<10;y++))
do
echo "#第$[$y + 1]轮"

for ((qq=0;qq<6;qq++))
	do
		rand_arr[$qq]=$(openssl rand -base64 8|cksum |cut -c2-3)
	done

	ret=$(generate_randNum ${rand_arr[*]})
	echo "ret: ${ret[*]}"
	new_rand_arr[$y]=${ret}
	#echo "new_rand_arr[$y]: ${new_rand_arr[*]}"
	
done
echo "统计概率数组: ${new_rand_arr[*]}"
