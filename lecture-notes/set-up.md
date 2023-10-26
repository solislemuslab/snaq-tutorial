---
layout: default
title: Installing dependencies and downloading data
nav_order: 1
---

# Downloading data via git clone

You should navigate to the path where you want to have the data, and clone this repository:

```
git clone https://github.com/solislemuslab/snaq-tutorial.git
```

This will download the learning materials and the data (in folder [`data`](https://github.com/solislemuslab/snaq-tutorial/tree/main/data)).

We will get inside the folder with 
```
cd snaq-tutorial
cd data
```

If you are using your own data, simply navigate to the folder where you have your data.

# Installing dependencies

There are two options to install the dependencies: 1) via Docker or 2) manually. We describe both approaches next.

# 0ption 1: Installing Dependencies via Docker

To run a Docker container, you need two things: a DockerHub account and a Docker Engine.

## 1. Get a DockerHub account

To register for a DockerHub account, go to [DockerHub website](https://hub.docker.com/) and follow the sign-up steps.

## 2. Get a Docker Engine

To install a Docker Engine, go to [Docker Engine website](https://www.docker.com/products/docker-desktop/). 

## 3. Get the Docker container

Now you finish all the setting up steps, it's time to get an actual container for TICR pipeline. To get the Docker container, open a terminal (for Windows user, open the PowerShell) and navigate to the folder where you store the dataset that you wish to run, and enter

```
docker login
```

You should be able to see the following in the terminal:

```
Authenticating with existing credentials...
Login Succeeded
```

After login, type the following in the command:

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

Now you have the Docker image! 

To run the Docker container of TICR pipeline, run the following command:

```
docker run --rm=true -it -v ${pwd}:/scratch -w /scratch solislemus/ticr-docker:1 /bin/bash
```

This will put the current directory (where your dataset is located) into the container but call it `/scratch`. When the container starts, `/scratch` will be the working directory.

You should see your terminal changed into this:
```
I have no name!@5a93cb:/scratch$
```

This means you are already in the TICR container with all required software installed and all dependencies sorted out! Now you could do anything in the pipeline as you would do locally.

## 1. Download the TICR scripts

We use the TICR scripts that run MrBayes, BUCKy and Quartet MaxCut:

```
git clone https://github.com/crsl4/TICR.git
```
