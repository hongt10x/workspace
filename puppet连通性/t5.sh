#!/bin/bash



function get_numProbability(){
	local rand_arr=($*)
	length=${#rand_arr[*]}
	for ((i=0;i<$length;i++))
	do
		sum=1
		echo "num--$i: ${rand_arr[$i]}"
		for ((j=i+1;j<=$length-1;j++))
		do
			left=${rand_arr[$i]}
			right=${rand_arr[$j]}
			echo "left:$left, right:$right"
			if [ $left -eq $right ];then
				let sum=sum+1
				#let i=${j}+1
				i=$j
				echo "i: $i"
			fi
		done
		echo "sum: $sum"
		prob=$(echo "$sum $length"|awk '{printf("%.2f",100*$1/$2)}')
		echo "${rand_arr[$i]}出现的概率为${prob}%"
	done
}


arr=(0 0 1 2 3 4 6 6 8 9)

get_numProbability ${arr[*]}
