---
layout: default
title: Set up
nav_order: 2
---

# Set up dependencies and working directory

If you are a participant in a workshop, please go to the section [For participants in workshops](https://solislemuslab.github.io/snaq-tutorial/lecture-notes/set-up.html#for-participants-in-workshops).

If you are not a participant in an workshop, please follow the next sections to set up your working directory and install dependencies either via Docker or manually:


## Installing dependencies

There are two options to install the dependencies: 1) via Docker or 2) manually. We describe both approaches next.

### Option 1: Installing Dependencies via Docker

To run a Docker container, you need two things: a DockerHub account and a Docker Engine.

#### 1. Get a DockerHub account

To register for a DockerHub account, go to [DockerHub website](https://hub.docker.com/) and follow the sign-up steps.

#### 2. Get a Docker Engine

To install a Docker Engine, go to [Docker Engine website](https://www.docker.com/products/docker-desktop/). 

#### 3. Get the Docker container

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

Note that Docker Desktop needs to be running, so if you are running these steps on different days, make sure to open Docker Desktop before `docker pull`.

The `docker pull` command will start pulling the Docker image from the docker hub. After it is done, type the following into the terminal:

```
docker image ls
```

You should see something similar to this:

```
REPOSITORY               TAG       IMAGE ID       CREATED       SIZE
solislemus/ticr-docker   1         c71702751c24   3 months ago   2.15GB
```

The image ID might be different.

Now you have the Docker image! 

To run the Docker container of TICR pipeline, run the following command:

```
docker run -it -w /scratch solislemus/ticr-docker:1 /bin/bash
```

When the container starts, `/scratch` will be the working directory.

You should see your terminal changed into this:
```
root@2c79e088aa44:/scratch#
```

This means you are already in the Docker container with all required software installed and all dependencies sorted out! Now you could do anything in the pipeline as you would do locally.

{.warning}
Note that the versions installed within the Docker are Julia v1.9.2 and PhyloNetworks v0.16.2.


### Option 2: Install dependencies manually

- Download [BUCKy](http://pages.stat.wisc.edu/~ane/bucky/index.html)
- Download [MrBayes](http://nbisweden.github.io/MrBayes/)
- Download [Julia](https://julialang.org) and
  follow instructions to install julia
- Install the necessary packages: open julia then type
    ```julia
    using Pkg # to use functions that manage packages
    Pkg.add("PhyloNetworks") # to download & install package PhyloNetworks
    Pkg.add("SNaQ")
    Pkg.add("PhyloPlots")
    Pkg.add("RCall")      # packaage to call R from within julia
    Pkg.add("CSV")        # to read from / write to text files, e.g. csv files
    Pkg.add("DataFrames") # to create & manipulate data frames
    Pkg.add("StatsModels")# for regression formulas
    using PhyloNetworks   # may take some time: pre-compiles functions in that package
    using PhyloPlots
    ```
    and close julia with `exit()`.


You also want to create a folder that will have the data and the dependencies. We can call this folder `my-analysis`, and make sure to move inside this folder in the terminal with:

```
mkdir my-analysis
cd my-analysis
```


## Download the TICR scripts

Whether you are in `/scratch` inside the Docker, or in a project directory `my-analysis`, you have to git clone the [PhyloUtilities repo](https://github.com/JuliaPhylo/PhyloUtilities) with the TICR scripts and QuartetMaxCut. These scripts were originally in the [TICR repo](https://github.com/nstenz/TICR).

```
pwd ## you are in /scratch or your working directory
git clone https://github.com/JuliaPhylo/PhyloUtilities.git
```

We will be using the [standard scripts](https://github.com/JuliaPhylo/PhyloUtilities/tree/main/scripts) to run on a local machine or server, but note that there are SLURM scripts available [here](https://github.com/nstenz/TICR/tree/master/scripts-cluster) and more information [here](https://juliaphylo.github.io/PhyloUtilities/notebooks/ticr_howtogetQuartetCFs.html).

## Download data via git clone

Whether you are in `/scratch` inside the Docker, or in a project directory `my-analysis`, you can clone this repository with the data:

```
pwd ## you are in /scratch or your working directory
git clone https://github.com/solislemuslab/snaq-tutorial.git
```

This will download the learning materials and the data (in folder [`data`](https://github.com/solislemuslab/snaq-tutorial/tree/main/data)).

If you are using your own data, simply create a folder with your data.

# For participants in workshops

## For participants in the MBL workshop

Login to your particular virtual machine (VM) using the IP address on the sticker attached to the back of your name tag. If, for example, your IP address was 123.456.789.321, you would type the following into the terminal on your local computer (i.e. your laptop) and press the enter key:

```bash
ssh moleuser@123.456.789.321
```

After login, you want to copy the `phylo-networks` in your home directory:

```
cp -r moledata/phylo-networks ./
cd phylo-networks
```

We will *not* cover an alternative [RAxML+ASTRAL pipeline](https://juliaphylo.github.io/PhyloUtilities/notebooks/Gene-Trees-RAxML.html) (which you could cover outside the workshop).


## For participants in the RBG workshop

Information ssh-ing to the Crop Diversity HPC cluster can be found [here](https://help.cropdiversity.ac.uk/ssh.html).

Basically, you have to use your username and password (or pass key):

```
ssh USERNAME@gruffalo.cropdiversity.co.uk
cd /mnt/shared/scratch/YOUR_USER_NAME/network_workshop
```