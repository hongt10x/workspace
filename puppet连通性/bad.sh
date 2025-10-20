#!/bin/bash


function BubbleSort(){
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
	return ${rand_arr[0]}
}


function CalculateProbability(){
	#计算随机数出现概率
	local rand_arr=($*)
	length=${#rand_arr[*]}
	for ((i=0;i<$length;i++))
	do
		sum=1
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
		#echo "Index为$i的值: ${rand_arr[$i]}出现的总次数为: ${sum} ,概率为${prob}%"
		echo "${rand_arr[$i]} 出现的总次数为: ${sum} ,概率为${prob}%"
	done
}


new_rand_arr=()
for ((y=0;y<500;y++))
do
echo "#第$[$y + 1]轮"


	rand_=$(openssl rand -base64 8|cksum |cut -c2-3)
	echo $rand_
	new_rand_arr[$y]=${rand_}
	#BubbleSort ${rand_arr[*]}
	#ret=$?
	#echo "ret: ${ret[*]}"
	#new_rand_arr[$y]=${ret}
	
done
echo "统计概率数组: ${new_rand_arr[*]}"
new_arange_arr=$(BubbleSort ${new_rand_arr[*]}) 
echo "排序后的数组: ${new_arange_arr[*]}"
CalculateProbability ${new_arange_arr[*]}



