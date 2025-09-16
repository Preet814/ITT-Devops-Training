#!/bin/bash

#---------------------------------
# Providing read permission to folder
# by taking path of folder from user
# ---------------------------------

function change_permission() {
        local folder_path="$1"
        if [ -d "$folder_path" ]; then
                echo "To whom do you want to grant read permissions?"
                echo "1. Owner"
                echo "2. Group"
                echo "3. Others"
                echo "4. Owner and Group"
                echo "5. Owner and Others"
                echo "6. Group and Others"
                echo "7. All"
                read -p "Enter your choice (1-7): " choice

                echo "Do you want to apply permissions to files inside the folder? (y/n): "
                read apply_to_files
                if [[ "$apply_to_files" == "y" || "$apply_to_files" == "Y" ]]; then
                        case $choice in
                                1) chmod -R u+r "$folder_path" ;;
                                2) chmod -R g+r "$folder_path" ;;
                                3) chmod -R o+r "$folder_path" ;;
                                4) chmod -R u+r,g+r "$folder_path" ;;
                                5) chmod -R u+r,o+r "$folder_path" ;;
                                6) chmod -R g+r,o+r "$folder_path" ;;
                                7) chmod -R a+r "$folder_path" ;;
                                *) echo "Invalid choice." ;;
                        esac
                else
                        case $choice in
                                1) chmod u+r "$folder_path" ;;
                                2) chmod g+r "$folder_path" ;;
                                3) chmod o+r "$folder_path" ;;
                                4) chmod u+r,g+r "$folder_path" ;;
                                5) chmod u+r,o+r "$folder_path" ;;
                                6) chmod g+r,o+r "$folder_path" ;;
                                7) chmod a+r "$folder_path" ;;
                                *) echo "Invalid choice." ;;
                        esac
                fi
                ls -ld "$folder_path"
        else
                echo "Folder does not exists at $folder_path"
        fi
}


echo "Enter path of folder"
read folder_path

change_permission "$folder_path"