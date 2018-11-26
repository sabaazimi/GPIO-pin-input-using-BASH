#!/bin/bash
setbits(){
let "a=$1&1"
let "b=($1>>1)&1"
let "c=($1>>2)&1"
let "d=($1>>3)&1"
if [ $a -eq 1 ]
then
	gpio write 0 1
fi

if [ $b -eq 1 ]
then
	gpio write 1 1
fi
if [ $c -eq 1 ]
then
	gpio write 2 1
fi
if [ $d -eq 1 ]
then
	gpio write 3 1
fi

}

setoff()
{
	
	for ii in {0..3}
	do
		
		gpio write $ii 0
	done
	
	}


setoff
i=1

bb=1
while [ 1 ]
do 
	
	aa=$(gpio read 5)
	if [ $aa -eq 0 ] && [ $bb -eq 1 ]
	then 
		setoff
		bb=0
		echo $i
			if [ $i -lt 16 ]
			then
			setbits $i
			
			((i++))
			else 
			echo DONE
			gpio write 4 1
			sleep 3s
			gpio write 4 0
			fi
			
		else if [ $aa -eq 1 ] && [ $bb -eq 0 ]
		then 
		bb=1
		fi
		
	fi	
done


