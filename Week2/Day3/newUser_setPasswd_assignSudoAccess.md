**Create a new user**
# sudo adduser <user_name>
Command to add new user. This command will promt to add password. 

**If adduser doesn't prompt for a password, use passwd:**
# sudo passwd <user_name>

**Assign sudo access to user:**
# sudo usermod -aG sudo <username>

usermod command is user to modify user's account settings

-a is used to append

-GSpecifies the group(s) to add the user to.

sudo the group in which the user is added.

**Assigning user to specific group**
**Create a group**
# sudo groupadd <group_name>

**Add user to that group**
# sudo usermod -aG <groupname> <username>s