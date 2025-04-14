**Assignment: Create Dockerfile to build and run .NET core application**

1. Run docker command to build image from dockerfile:

# docker build -t dotnet_image .

![alt text](image.png)

2. Create container from the image using command:

# docker run --name=dotnet_container -p 8000:8080 dotnet_image:latest

![alt text](image-1.png)

See on web browser by searching localhost:8000

![alt text](image-2.png)