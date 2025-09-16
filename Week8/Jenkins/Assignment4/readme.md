**Assignment: Create Webhook and different job triggers implementation.**

Copy any github repo url:

![alt text](image-2.png)

Create a freestyle Job with source code management as Git:

![alt text](image-1.png)

Different Job triggers:

1. Trigger builds remotely 

In this we can trigger the build of a job by hitting this URL on browser:
>> JENKINS_URL/job/triggers/build?token=TOKEN_NAME

![alt text](image.png)

Before hitting url number of builds are:

![alt text](image-3.png)

Hitting URL on browser:

![alt text](image-4.png)

Now the number of builds:

![alt text](image-5.png)

But there is one issue with this trigger. If we trigger this URL on incognito mode or curl this URL it will ask authentication and will not trigger the build.

![alt text](image-6.png)

To overcome this we can install a plugin : build authorization token root

![alt text](image-7.png)

Now we can run this URL on incognito and can curl also it will not ask for authenication:

>> buildByToken/buildWithParameters?job=RevolutionTest&token=TacoTuesday&Type=Mexican

Now if i hit this url on incognito then it will trigger the build:

![alt text](image-8.png)

![alt text](image-9.png)

One more build is triggered.


2. Build after other projects are buit

In this i create another item named demo-trigger.

![alt text](image-10.png)

Now in my triggers item only i added the configuration like this:

![alt text](image-11.png)

This means if demo-trigger get build with stable output then only build of this item get triggered.

Now demo-trigger item is build manually.

![alt text](image-12.png)

We can see triggers item also got triggered and build the item.

![alt text](image-13.png)

Other options are:

1. Trigger only if build is stable : Triggered on Build Status = SUCCESS and does not triggered on Build Status: UNSTABLE, FAILURE, ABORTED
2. Trigger even if the build is unstable : Triggered on Build Status = SUCCESS, UNSTABLE and does not triggered on Build Status: FAILURE, ABORTED
3. Trigger even if the build fails : Triggered on Build Status = SUCCESS, UNSTABLE, FAILURE and does not triggered on Build Status: ABORTED
4. Always trigger, even if the build is aborted : Triggered on Build Status = SUCCESS, UNSTABLE, FAILURE, ABORTED.



3. Build periodically

In this we have to add cronjob with specific schedule at which it should automatically build job again and again.

![alt text](image-14.png)

I have added cron job to trgger the build after every one minute.

In build step i have added shell command : date

![alt text](image-15.png)

Now we can see after every minute the build is triggered.

![alt text](image-16.png)


4. Poll SCM

In this also we add a cronjob to schedule to trigger the build but instead of triggering build according to schedule it just checks the code uploaded on github after the time it is scheduled and if it founds any different in the code it will trigger the build.

![alt text](image-17.png)

initially it triggers for one time:

![alt text](image-18.png)

Later on only it get triggered when i make any change to my code on github

![alt text](image-19.png)

![alt text](image-20.png)


5. Webhook trigger

Step 1: Create a freestyle job with configuration like SCM - github repo url, Triggers select GitHub hook trigger for GITScm polling and add build step shell.

![alt text](image-21.png)

![alt text](image-22.png)

![alt text](image-23.png)

Step 2: Click on apply and save.

Step 3: Go to github repo > settings > webhook

![alt text](image-24.png)

Step 4: Click on add webhook and add configuration like:

![alt text](image-25.png)

Step 5: Click on add webhook.

![alt text](image-26.png)

Step 6: Now make push any changes to github repo and see the build getting triggered.

![alt text](image-27.png)

![alt text](image-28.png)