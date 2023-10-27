# Tutorial to run the Docker

TICR pipline requires multiple software and dependencies sorted out correctly to run. You might run into many issue if you install it locally, for example, a different version of complier. To make it easier, we pre-installed everything required in the pipeline in a Docker container, so that you could simple get the docker container and run the pipeline with no hassle.

The concept of Docker containers is actually quite simple. A Docker container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. In this case, you could imagine that you are running the TICR pipeline using the same laptop as everyone else in the workshop handed out by us, with all software pre-installed and dependencies sorted out.

## Step 1: Setup
To run a container, you need two things: a DockerHub account and a Docker Engine. Let's start from the easy one: setting up the DockerHub.

### Getting a DockerHub account
To register for a DockerHub account, go to [DockerHub website] and follow the sign-up steps. The DockerHub is used as a distribution site. You would create a Docker image locally (A Docker images act as a set of instructions to build a Docker container), and then push it to DockerHub. When the server execute your code that should run in your container, it will pull the image from your DockerHub and build the container with it. The users of your container would also pull from your DockerHub as well. More on this later, for now you just need to register for an account on DockerHub.

### Getting a Docker Engine
Installing a Docker Engine may vary on different operating systems. There are two options: you could either download a Docker Desktop for your system or directly download a Docker Engine if you are running a Linux system locally. I would recommend the first option, The Docker Desktop is basically a user interface wrapped around a Docker Engine. It is easier to use, and better maintained.

For Windows users, download Docker Desktop on the [Windows link]. For Mac users, you could find it on the [Mac link]. Note that if you are using a MacOS, you need to make sure if you are using an Intel Chip or Apple Chip. You need to download your version accordingly. For Linux users, Docker Desktop only supports Ubuntu, Debian, and Fedora. You could find the package and installation instructions on the [Linux link]. If you are not using those three systems, you should download the Docker Engine directly from the [Engine link] and follow the instruction on this page.

Follow the installation instruction on the pages. Under most circumstances, you install Docker Desktop like any other software on your system, but it does allow command-line installation. It takes a while for Docker to start. For Docker Desktop, you could see an interface. Click Login on the top right corner of the interface with your DockerHub login and password to link the Docker Desktop with your Dockerhub account. For Docker Engine, you won't see a window, you’ll just see a little whale and container icon in one of your computer's toolbars.

## Step 2: Get the docker container

Now you finish all the setting up steps, it's time to get an actual container for TICR pipeline. To get the Docker container we are going to use today, open a terminal (for Windows user, open the PowerShell) and navigate to the folder where you store the dataset that you wish to run, and enter
```{sh}
docker login
```
You should be able to see the following in the terminal:
```
Authenticating with existing credentials...
Login Succeeded
```
After login, type the following in the command (Note for Claudia: I forgot your DockerHub user name, so you might want to change all docker image names in the following sections)
```
docker pull solislemus/ticr-docker:1
```
This command will start pulling the Docker image from the docker hub. After it is done, type the following into the terminal:
```
docker image ls
```
You should see something similar to this:
```
REPOSITORY               TAG       IMAGE ID       CREATED       SIZE
solislemus/ticr-docker   1         5f4642b01f92   4 days ago   2.29GB
```
The image ID might be different.

Now you have the Docker image! To run the Docker container of TICR pipeline, run the following command:
```
docker run -it -v ${pwd}:/scratch -w /scratch solislemus/ticr-docker:1 /bin/bash
```
When the container starts, `/scratch` will be the working directory.

You should see your terminal changed into this:
```
I have no name!@5a93cb:/scratch$
```

This means you are already in the TICR container with all required software installed and all dependencies sorted out! Now you could do anything in the pipeline as you would do locally.

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)
   [CHTC]: <https://chtc.cs.wisc.edu/>
   [DockerHub website]: <https://hub.docker.com/>
   [Windows link]: <https://docs.docker.com/desktop/install/windows-install/>
   [Mac link]: <https://docs.docker.com/desktop/install/mac-install/>
   [Linux link]: <https://docs.docker.com/desktop/install/linux-install/>
   [Engine link]: <https://docs.docker.com/engine/install/centos/>
   [Dockerfile reference]: <https://docs.docker.com/engine/reference/builder/>
