#!/bin/bash

a="goodbye"

# ${var} 变量本来的值
echo ${a}
#unset a

echo "###a:-word"
# ${var:-word} 如果变量 var 为空或已被删除(unset)，那么返回 word，但不改变 var 的值。
echo ${a:-word}
echo "a:-word -- $a"

echo "###a:-word"


echo "###a:=word"
# ${var:=word} 如果变量 var 为空或已被删除(unset)，那么返回 word，并将 var 的值设置为 word。
echo ${a:=word}
echo "a:=word -- $a"

echo "###a:=word"


echo "###a:+word"
# ${var:+word} 如果变量 var 被定义，那么返回 word，但不改变 var 的值。
echo ${a:+word}
echo "a:+word -- $a"

echo "###a:+word"


# ${var:?message} 如果变量 var 为空或已被删除(unset)，那么将消息 message 送到标准错误输出，可以用来检测变量 var 是否可以被正常赋值。若此替换出现在Shell脚本中，那么脚本将停止运行。
$ a=0
$ echo ${a:?message}
0

$ unset a

$ echo ${a:?message}
bash: a: message

$ echo $?
1


#变量内字符串替换
$ a="abcabc123321"

#替换首次匹配到的，不改变原值
$ echo ${a/a/bb}
bbbcabc123321

#替换所有匹配到的，不改变原值
$ echo ${a//a/bb}
bbbcbbbc123321

$ echo $?
0


#sed实现
$ a="abcabc123321"

$ echo $a |sed 's/a/b/'
bbcabc123321

$ echo $a |sed 's/a/b/g'
bbcbbc123321

#awk实现
$ a="abc321 abc123321"

$ echo $a |awk '{gsub(/a/,"b",$1);print $0}'
bbc321 abc123321

$ echo $a |awk '{gsub(/a/,"b",$2);print $0}'
abc321 bbc123321

$ echo $a |awk '{gsub(/a/,"b");print $0}'
bbc321 bbc123321


