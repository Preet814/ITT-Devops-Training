What is Merge conflicts? 

Conflicts generally arise when two people have changed the same lines in a file, or if one developer deleted a file while another developer was modifying it. In these cases, Git cannot automatically determine what is correct. Conflicts only affect the developer conducting the merge, the rest of the team is unaware of the conflict. Git will mark the file as being conflicted and halt the merging process. It is then the developers' responsibility to resolve the conflict. 

Let's create a merge conflict: 

This code example executes a sequence of commands that accomplish the following. 

Create a new directory named git-merge-test, change to that directory, and initialize it as a new Git repo. 

Create a new text file merge.txt with some content in it.   

Add merge.txt to the repo and commit it. 

Next, we will create a new branch to use as the conflicting merge. 

create and check out a new branch named  new_branch_to_merge_later 

overwrite the content in merge.txt   

commit the new content 

This chain of commands checks out the main branch, appends content to merge.txt, and commits it. This now puts our example repo in a state where we have 2 new commits. One in the main branch and one in the new_branch_to_merge_later branch.  

Lets git merge new_branch_to_merge_later and see what happens! 


How to identify a merge conflict? 

The output from git status indicates that there are unmerged paths due to a conflict. The merge.text file now appears in a modified state. Let's examine the file and see whats modified. 

We can see some strange new additions 

<<<<<<< HEAD 

======= 

>>>>>>> new_branch_to_merge_later 

Think of these new lines as "conflict dividers". The ======= line is the "center" of the conflict. All the content between the center and the <<<<<<< HEAD line is content that exists in the current branch main which the HEAD ref is pointing to. Alternatively all content between the center and >>>>>>> new_branch_to_merge_later is content that is present in our merging branch. 


How to resolve merge conflicts? 

The most direct way to resolve a merge conflict is to edit the conflicted file. Open the merge.txt file in your favorite editor. For our example lets simply remove all the conflict dividers. The modified merge.txt content should then look like: 

Once the file has been edited use git add merge.txt to stage the new merged content. To finalize the merge create a new commit by executing: 

Git will see that the conflict has been resolved and creates a new merge commit to finalize the merge. 

How to avoid merge conflicts? 

-> Pull latest changes again and again. 

-> Commit small, frequent changes. 

-> Use rebase instead of merging. 

-> Communicate with team member properly. 