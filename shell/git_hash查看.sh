#!/bin/bash

echo "工作区$1的hash：$(git hash-object -t blob $1 )"
echo "暂存区$1的hash：$(git ls-files -s $1 |awk '{print $2}')"
echo "本地库$1的hash：$(git rev-list --objects --all|grep $1|head -1 )"

<<!
工作区1.sh的hash：fe5a0bf f955177077bcf10bdc0800a57815f3025
暂存区1.sh的hash：7d854c2 9b9c9c5aa32df9110ba54358f5129e5a4
本地库1.sh的hash：58c9bdf 9d017fcd178dc8c073cbfcbb7ff240d6c 1.sh

暂存区与工作区文件比较：$ git diff 1.sh
warning: in the working copy of '1.sh', LF will be replaced by CRLF the next time Git touches it
diff --git a/1.sh b/1.sh
index 7d854c2..fe5a0bf 100644


本地库与暂存区文件的比较：$ git diff --cached 1.sh
diff --git a/1.sh b/1.sh
index 58c9bdf..7d854c2 100644


本地库与工作区文件的比较：$ git diff HEAD 1.sh
warning: in the working copy of '1.sh', LF will be replaced by CRLF the next time Git touches it
diff --git a/1.sh b/1.sh
index 58c9bdf..fe5a0bf 100644

!