#!/bin/bash


#---------------------------------------
# Providing read and write permission to a file
# by taking location of file as input and passed
# to function as parameters.
# --------------------------------------


function change_permission() {
        local file_path="$1"
        if [ -f "$file_path" ]; then
                echo "To whom do you want to grant read and write permissions?"
                echo "1. Owner"
                echo "2. Group"
                echo "3. Others"
                echo "4. Owner and Group"
                echo "5. Owner and Others"
                echo "6. Group and Others"
                echo "7. all"
                echo "Enter your choice (1-7): "
                read choice

                case $choice in
                        1) chmod u+rw "$file_path"
                                echo "Read and write permissions granted to OWNER for: $file_path" ;;
                        2) chmod g+rw "$file_path"
                                echo "Read and write permissions granted to GROUP for: $file_path" ;;
                        3) chmod o+rw "$file_path"
                                echo "Read and write permissions granted to OTHERS for: $file_path" ;;
                        4) chmod u+rw,g+rw "$file_path"
                                echo "Read and write permissions granted to OWNER and GROUP for: $file_path" ;;
                        5) chmod u+rw,o+rw "$file_path"
                                echo "Read and write permissions granted to OWNER and OTHERS for: $file_path" ;;
                        6) chmod g+rw,o+rw "$file_path"
                                echo "Read and write permissions granted to GROUP and OTHERS for: $file_path" ;;
                        7) chmod a+rw "$file_path"
                                echo "Read and write permissions granted to ALL (owner, group, others) for: $file_path" ;;
                        *) echo "Invalid choice." ;;
                esac
                ls -l "$file_path"

        else
                echo "File does not exists at $file_path"
        fi

}


echo "Enter path of file whose permission you want to change: "
read file_path

change_permission "$file_path"