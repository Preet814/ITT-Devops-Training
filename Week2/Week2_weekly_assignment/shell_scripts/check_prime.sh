#!/bin/bash


#----------------------
# Input a number from user
# and check if the number
# is prime or not.
# ---------------------


function check_prime() {
        local number="$1"
        if [ $number -lt 2 ]; then
                echo "$number is not a prime number"
                return
        fi
        local flag=0
        for ((i=2; i*i <= number; i++)); do
                if ((number%i ==0)); then
                        flag=1
                        break
                fi
        done
        if [ "$flag" -eq 0 ]; then
                echo "$number is a prime number"
        else
                echo "$number is not a prime number"
        fi
}

echo "Input a number: "
read number

check_prime "$number"