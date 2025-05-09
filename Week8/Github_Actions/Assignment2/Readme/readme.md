**Assignment: Use self-hosted runners and configure environment variables & secrets.**

 
1. Using ENV variables and secrets at step level

Now when we push the file env_at_steps_level.yaml to github

![alt text](image.png)

One of the problem with secret is that it is easily visible in logs.


2. Using env variables and secrets at job level

Now when we push the file env_at_job_level.yaml to github

![alt text](image-3.png)

Here we can see the secrets can be accessed using logs.


3. Using env variables and secrets at repo level

![alt text](image-5.png)

![alt text](image-6.png)

Now when we push the file env_secrets_at_repo_level.yaml to github

![alt text](image-4.png)