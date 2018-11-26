#!/bin/bash

while [ 1 ]
do
a=$(gpio read 5)
	if [ $a -eq 1 ]
		then
		echo Not pressed
		else
		echo pressed
		fi
done

