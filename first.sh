#!/bin/bash

num=1
while [ $num -lt 201 ]
do

curl -A "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0" https://www.dnb.com/business-directory/company-information.manufacturing-sector.in.maharashtra.pune.html?page=$num | grep "company-profiles" | cut -c 42- | rev | cut -c 4- | rev | sed "1 d" >> companies.txt

let num++
done

