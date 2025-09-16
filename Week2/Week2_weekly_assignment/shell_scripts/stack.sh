#!/bin/bash


#---------------------------------
# Script to create stack with all the
# operations like push, pop, isEmpty,
# isFull, size and peek.
# --------------------------------

top=-1
stack=()

push() {
    if [ $((top + 1)) -ge $2 ]; then
        echo "Stack is Full"
    else
        ((top++))
        stack[$top]=$1
        echo "$1 pushed to stack"
    fi
}

pop() {
    if [ $top -lt 0 ]; then
        echo "Stack is Empty"
    else
        echo "Popped element: ${stack[$top]}"
        unset stack[$top]
        ((top--))
    fi
}

peek() {
    if [ $top -lt 0 ]; then
        echo "Stack is Empty"
    else
        echo "Top element: ${stack[$top]}"
    fi
}

isEmpty() {
    if [ $top -lt 0 ]; then
        echo "Stack is Empty"
    else
        echo "Stack is NOT Empty"
    fi
}

isFull() {
    if [ $((top + 1)) -ge $1 ]; then
        echo "Stack is Full"
    else
        echo "Stack is NOT Full"
    fi
}

size() {
    echo "Current size of stack: $((top + 1))"
}


display() {
    if [ $top -lt 0 ]; then
        echo "Stack is Empty"
    else
        echo "Stack elements:"
        for ((i = top; i >= 0; i--)); do
            echo "${stack[$i]}"
        done
    fi
}

echo "Enter size of stack: "
read stack_size

while true; do
        echo "Choose operation to perform on stack: "
        echo "1. Push"
        echo "2. Pop"
        echo "3. Peek"
        echo "4. isEmpty"
        echo "5. isFull"
        echo "6. Size"
        echo "7. Display"
        echo "8. Exit"
        echo "Enter your choice: "
        read choice

        case $choice in
                1)
                        echo "Enter value to push:"
                        read value
                        push "$value" "$stack_size"
                        ;;
                2) pop ;;
                3) peek ;;
                4) isEmpty ;;
                5) isFull "$stack_size" ;;
                6) size ;;
                7) display ;;
                8) exit ;;
                *) echo "Invalid choice, try again!" ;;
        esac
done