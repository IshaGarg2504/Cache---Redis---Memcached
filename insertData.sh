#!/bin/sh  
a=0
while true  
do 
a=$((a+1))
echo 'set Hello'$a' World' | redis-cli
sleep 30 
done
