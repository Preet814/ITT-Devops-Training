Git Commands Used:
1.	git init
Used to initialize and create local git repository.

2.	rm –rf .git/
Removes local git repository.
•	rm : removes files or directories.
•	-r : recursively deletes all files and subdirectories inside .git folder.
•	-f : force delete.
•	.git/ : hidden folder that stores all the git repository data.

3.	git init –initial-branch=main
Initialize git with master branch name as main

4.	git status
Give information about which files are in the staging area, and which are not.
•	Git status –v : for detailed information
•	Git status –s: for short information

5.	git add <file_name>
Adds a particular file to staging area.
•	Git add . : used for staging multiple files at once

6.	git rm –cached <file_name>
Removes a file from staging area and moves it to non-staging area.

7.	git commit –m <message>
Tracks the staged files. Snapshot of file is taken, and a commit object is created which contains 4 things:
•	Who made commit. 
•	When the commit was made.
•	Commit message.
•	Commit id made through SHA-1 encryption algorithm.


8.	git commit –a –m <message>
If changes are made on a tracked file.

9.	git commit –s –m <message>
Signoff commit done by either client or technical lead stating that a particular part of project is completed and added a digital signature.

10.	git commit –allow –empty –m <message>
Empty commit is made. If i want to trigger my CI pipeline with a commit then i can use this command.

11.	git log
View all the commits made till now.
•	Git log –oneline : See commit information in oneline

12.	Reset
•	Git reset –soft <id> : Changes are resettled to staging area.
•	Git reset –mixed <id> : Changes are moved to non-staging area.
•	Git reset –hard <id> : Head pointer moves to <id> commit and changes are erased.

13.	git revert <id>
Particular <id> changes are removed but it is still tracked in git log.

14.	git branch
Gives list of all the branches present in local system.

15.	git branch <branch_name>
Create a new branch in the local system.

16.	git checkout <branch_name>
Switch from current branch to new branch

17.	git checkout –b <branch_name>
Creates a new branch and switches to a new branch.

18.	git branch –D <branch_name>
Deletes a branch in local system.

19.	git switch <branch_name>
Similar to checkout only. Switches from current branch to new branch.

20.	git merge <branch_name>
Another branch commits will be merged with the current branch.

21.	git cherry-pick <id>
Bring changes from one branch to another branch without merging. Basically, used for merging specific commits from one branch to another.

22.	git remote add origin <link>
Builds connection between local repository with remote repository.

23.	git push –u origin main
Push the changes from local to remote repository. -u flag is upstream flag used to create initial branch in remote server.

24.	git clone <url>
Copy entire code base from remote to local

25.	git fetch 
Only downloads the changes from remote to local but doesn't update the local system with changes. To update the changes in local system, use git merge origin/main command.

26.	git pull origin main
Combination of git fetch and git merge command. Downloads the changes from remote and also updates the local system.

27.	git fetch –prune
If any branch is deleted from remote server, then this command updates the local system with branches.

28.	git fetch –all
Downloads the data from all the remote repositories either it may be bitbucket, github or gitlabs.

29.	git stash
Temporarily pops recent files and pushed in temporary space.

30.	git stash –list
Gives list of all the files present in temporary space.

31.	git stash apply <id>
Push files from temporary space to main using their id.


