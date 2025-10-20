#!/bin/bash


function generate_randNum(){
	#冒泡排序
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
}


function get_numProbability(){
	length=${#rand_arr[*]}
	for ((i=0;i<$length;i++))
	do
		sum=1
		for ((j=i+1;j<$length-$i;j++))
		do
			left=${rand_arr[$i]}
			right=${rand_arr[$j]}
			if [ $left -eq $right ];then
				let sum+=1
			fi
		done
		#echo "sum: $sum"
		prob=$(echo "$sum $length"|awk '{printf("%.2f",100*$1/$2)}')
		echo "rand_arr[$i]出现的概率为${prob}%"
	done
}


for ((ii=1;ii<=10;ii++))
do
echo "#第$ii轮"
for ((q=0;q<10;q++))
	do
		rand_arr[$q]=$(openssl rand -base64 8|cksum |cut -c2-3)
	done


	generate_randNum

	get_numProbability
done

