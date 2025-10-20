
#OLD_IFS=$IFS
#IFS='\n'
#cat $1 |sort -u > 2.log
out=`cat $1 |sort -u|sed '/^$/d' |tr '\n' '|'` 
echo "${out%*|}"
#sed -i 's#\\n# #g' $1

##cat $1

#IFS=$OLD_IFS
