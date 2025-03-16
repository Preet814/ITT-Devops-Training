**Steps to Schedule the Script Daily**

1. Open the Crontab File:
#crontab -e

2. Add the Cron Job to schedule the script every day at 6 AM:
0 6 * * * /path/to/disk_space_usage_script.sh