#!/bin/bash

# --------------------------------
# Writing script to find and replace
# string in a text file whose path
# will be inputted by user
# --------------------------------




function find_and_replace() {
        local file_path="$1"
        local original_string="$2"
        local updated_string="$3"

        if grep -q "$original_string" "$file_path"; then
                sed -i "s/$original_string/$updated_string/g" "$file_path"
                echo "Replaced $original_string with $updated_string in $file_path"
        else
                echo "String $original_string not found in $file_path"
        fi
}

echo "Enter path of file: "
read file_path

if [ -f "$file_path" ]; then
        echo "Enter original string: "
        read original_string
        echo "Enter updated string: "
        read updated_string
        find_and_replace "$file_path" "$original_string" "$updated_string"
else
        echo "File is not present at path: $file_path"
fi