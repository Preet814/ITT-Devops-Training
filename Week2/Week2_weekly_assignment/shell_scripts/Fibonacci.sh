#!/bin/bash

# ---------------------------
# Generate Fibonacci Series
# ---------------------------

function generate_fibonacci() {
    local n="$1"
    local a=0
    local b=1

    echo "Fibonacci series up to $n terms:"
    echo "$a"
    echo "$b"
    for ((i = 2; i < n; i++)); do
        local next=$((a + b))
        a=$b
        b=$next
        echo "$next"
    done
    echo
}

echo "Enter the number of terms: "
read num_terms

generate_fibonacci "$num_terms"