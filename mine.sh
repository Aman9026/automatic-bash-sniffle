#!/bin/bash
filename='companies.txt'
n=1
while read line; do
# reading each line


jsonStartNum=$(curl -s -A "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0" $line | grep -n "@context" | sed "1 d" | cut -c -4)

jsonStartNum=$(($jsonStartNum - 1))

jsonEndNum=$(curl -s -A "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0" $line | grep -n "telephone" | cut -c -4)

jsonEndNum=$(($jsonEndNum + 1))



curl -s -A "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0" $line | sed -n "${jsonStartNum},${jsonEndNum}p" >> result.txt

echo "Company No. $n"

#echo $jsonStartNum
#echo $jsonEndNum

n=$((n+1))
done < $filename
