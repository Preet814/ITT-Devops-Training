#!/bin/bash


# --------------
# Reading size and inputting elements for array from user
# display alternate elements from an array
# --------------


# Read size of array from user
echo "Enter size of an array"
read n

#Declaring an array
declare -a array

#taking n inputs for an array
echo "Enter elements in an array"
for ((i=0; i< n; i++))
do
        read array[$i]
done

#Printing alternate elements from an array
echo "Alternate elements from an array"
for ((i=0; i<n; i+=2))
do
        echo "${array[$i]} "
done