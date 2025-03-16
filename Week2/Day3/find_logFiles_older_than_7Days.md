**Find all .log files in /var/log/ older than 7 days.**

# sudo find /var/log/ -type f -name "*.log" -mtime +7

sudo - To access using root privilages.

find – Command used to search for files in a directory hierarchy.

/var/log/ – The directory where the search starts.

-type f – Searches for only files.

-name "*.log" – Filters files with the .log extension.

-mtime +7 – Finds files that were modified more than 7 days ago.
