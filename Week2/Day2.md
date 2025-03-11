#!/bin/bash
 
# Check if two numbers are passed as arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <number1> <number2>"
    exit 1
fi
 
# Assign input parameters to variables
number_one=$1
number_two=$2
 
# Display operation choices
echo "List of operations:"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
echo "5. Modulus"
 
# Take user choice
read -p "Enter the operation number you want to choose: " choice
 
# Perform arithmetic operations based on choice
case "$choice" in
    1)
        result=$((number_one + number_two))
        echo "Addition of $number_one and $number_two is $result"
        ;;
    2)
        result=$((number_one - number_two))
        echo "Subtraction of $number_one and $number_two is $result"
        ;;
    3)
        result=$((number_one * number_two))
        echo "Multiplication of $number_one and $number_two is $result"
        ;;
    4)
        if [ "$number_two" -eq 0 ]; then
            echo "Error: Division by zero is not allowed."
        else
            result=$((number_one / number_two))
            echo "Division of $number_one by $number_two is $result"
        fi
        ;;
    5)
        if [ "$number_two" -eq 0 ]; then
            echo "Error: Modulus by zero is not allowed."
        else
            result=$((number_one % number_two))
            echo "Modulus of $number_one and $number_two is $result"
        fi
        ;;
    *)
        echo "Invalid Choice! Please select a number between 1 and 5."
        ;;
esac