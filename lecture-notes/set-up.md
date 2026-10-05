---
layout: default
title: Set up
nav_order: 2
---

# Set up dependencies and working directory

If you are a participant in a workshop, please go to the section [For participants in workshops](https://solislemuslab.github.io/snaq-tutorial/lecture-notes/set-up.html#for-participants-in-workshops).

If you are not a participant in an workshop, please follow the next sections to set up your working directory:

## Installing dependencies

- Download [BUCKy](http://pages.stat.wisc.edu/~ane/bucky/index.html)
- Download [MrBayes](http://nbisweden.github.io/MrBayes/)
- Download [Tree-QMC](https://github.com/molloy-lab/TREE-QMC)
- Download [Julia](https://julialang.org) and
  follow instructions to install julia
- Install the necessary packages: open julia then type
    ```julia
    using Pkg # to use functions that manage packages
    Pkg.add("PhyloNetworks") # to download & install package PhyloNetworks
    Pkg.add("SNaQ")
    Pkg.add("PhyloTraits")
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

In the project directory `my-analysis`, you have to git clone the [PhyloUtilities repo](https://github.com/JuliaPhylo/PhyloUtilities) with the TICR scripts and QuartetMaxCut. These scripts were originally in the [TICR repo](https://github.com/nstenz/TICR).

```
pwd ## you are in your working directory
git clone https://github.com/JuliaPhylo/PhyloUtilities.git
```

We will be using the [standard scripts](https://github.com/JuliaPhylo/PhyloUtilities/tree/main/scripts) to run on a local machine or server, but note that there are SLURM scripts available [here](https://github.com/nstenz/TICR/tree/master/scripts-cluster) and more information [here](https://juliaphylo.github.io/PhyloUtilities/notebooks/ticr_howtogetQuartetCFs.html).

## Download data via git clone

In your project directory `my-analysis`, you can clone this repository with the data:

```
pwd ## you are in your working directory
git clone https://github.com/solislemuslab/snaq-tutorial.git
```

This will download the learning materials and the data (in folder [`data`](https://github.com/solislemuslab/snaq-tutorial/tree/main/data)).

If you are using your own data, simply create a folder with your data.

# For participants in workshops

## For participants in the MBL workshop

Login to your particular virtual machine (VM) using the IP address on the sticker attached to the back of your name tag. If, for example, your IP address was 123.456.789.321, you would type the following into the terminal on your local computer (i.e. your laptop) and press the enter key:

```bash
ssh -X moleuser@123.456.789.321
```

After login, you want to copy the `phylo-networks` in your home directory:

```
cp -r moledata/phylo-networks ./
cd phylo-networks
```

We will *not* cover the alternative [RAxML+ASTRAL pipeline](https://juliaphylo.github.io/PhyloUtilities/notebooks/Gene-Trees-RAxML.html) (which you could cover outside the workshop).
