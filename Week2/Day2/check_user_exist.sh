#!/bin/bash


# ----------------
# Script to check if user
# exists or not. Taking
# username input from user itself.
# ----------------


echo "Enter user name: "
read user_name

if grep -q "$user_name" /etc/passwd; then
        echo "User $user_name exists."
else
        echo "User $user_name does not exists."
fi