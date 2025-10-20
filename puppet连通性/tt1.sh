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
	#echo "数组从小到大排序为：${rand_arr[*]}"
	echo "${rand_arr[*]}"
	return ${rand_arr}
}


function get_numProbability(){
	local rand_arr=($*)
	length=${#rand_arr[*]}
	for ((i=0;i<$length;i++))
	do
		sum=1
		echo "num--$i: ${rand_arr[$i]}"
		for ((j=i+1;j<$length-1;j++))
		do
			left=${rand_arr[$i]}
			right=${rand_arr[$j]}
			if [ $left -eq $right ];then
				let sum=sum+1
				i=$j
			fi
		done
		prob=$(echo "$sum $length"|awk '{printf("%.2f",100*$1/$2)}')
		echo "${rand_arr[$i]}出现的概率为${prob}%"
	done
}


new_rand_arr=()
for ((y=0;y<10;y++))
do
echo "#第$[$y + 1]轮"

for ((qq=0;qq<6;qq++))
	do
		rand_arr[$qq]=$(openssl rand -base64 8|cksum |cut -c2-3)
	done

	generate_randNum ${rand_arr[*]}
	ret=$?
	#echo "ret: ${ret[*]}"
	new_rand_arr[$y]=${ret}
	
done
echo "统计概率数组: ${new_rand_arr[*]}"
new_arange_arr=$(generate_randNum ${new_rand_arr[*]}) 
echo "排序后的数组: ${new_arange_arr[*]}"
get_numProbability ${new_arange_arr[*]}



