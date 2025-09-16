**Assignment: Implement RBAC to restrict access and store credentials securely.**

**RBAC to restrict access**

1. Create one more user name demo:

![alt text](image.png)

2. Install the plugin named role based authorization strategy

![alt text](image-1.png)

3. Move to manage jenkins > security > authorization > role based strategy.

![alt text](image-2.png)

Click on apply and save.

4. Now select manage and assign roles section in manage jenkins

![alt text](image-3.png)

5. Create role that have only read access and name the role as viewer.

![alt text](image-4.png)

Click on apply and save.

6. Now select assign role from left sidebar and choose add user and assign the role created.

![alt text](image-5.png)

Now login with that user and check you can build any item or not

![alt text](image-6.png)

![alt text](image-7.png)

User can only read, he cannot build, configure or anything with the Job.


**Store credentials securely**

1. Move to jenkins manager > credentials > System > Global credentials and added a username and password credential

![alt text](image-8.png)

2. Create a pipeline job from Jenkinsfile and apply and save.

3. Build the pipeline and check the console output:

![alt text](image-9.png)


