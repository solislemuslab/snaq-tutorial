# SNaQ Tutorial: from sequences to network

## 0. Installing Dependencies via Docker

To run a Docker container, you need two things: a DockerHub account and a Docker Engine.

### 0.1 Get a DockerHub account

To register for a DockerHub account, go to [DockerHub website](https://hub.docker.com/) and follow the sign-up steps.

### 0.2 Get a Docker Engine

To install a Docker Engine, go to [Docker Engine website](https://www.docker.com/products/docker-desktop/). 

### 0.3 Get the Docker container

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

## 2. Input data: Multi-locus sequences in nexus files

You must have multiple aligned loci, each alignment in a separate nexus file.

Here, we will use the alignments in `xxx.tar.gz` which is a tarball that contains all 30 alignments (30 loci):
```
$ tar -ztf input/1_seqgen.tar.gz
1_seqgen10.nex
1_seqgen11.nex
1_seqgen12.nex
1_seqgen13.nex
...
1_seqgen6.nex
1_seqgen7.nex
1_seqgen8.nex
1_seqgen9.nex
```

If you have the separate nexus files, you can tar them with the command:
```
tar xxxx
```

## 3. Estimating gene trees with MrBayes

### 3.1 Input for MrBayes

You need to write a MrBayes block with the parameters for MrBayes.
Here, we provide a MrBayes block in `mbblock.txt`:

```
$ cat mbblock.txt
begin mrbayes;
set nowarnings=yes;
set autoclose=yes;
lset nst=2;
mcmcp ngen=100000 burninfrac=.25 samplefreq=50 printfreq=10000 [increase these for real]
diagnfreq=10000 nruns=2 nchains=2 temp=0.40 swapfreq=10;       [increase for real analysis]
mcmc;
sumt;
end;
```

Make sure to increase the number of generations (`ngen`) and to modify the other chain parameters for your real analysis.

### 3.2 Running MrBayes

We are ready to analyze all loci with MrBayes:
```
$ ../scripts/mb.pl 1_seqgen.tar.gz -m mbblock.txt -o mb-output

Script was called as follows:
perl mb.pl 1_seqgen.tar.gz -m mbblock.txt -o mb-output

Appending MrBayes block to each gene... done.

Job server successfully created.

  Analyses complete: 30/30.
  All connections closed.
Total execution time: 46 seconds.
```

For more information on how to run this analysis in a cluster, check [here]().

### 3.3 Output for MrBayes

The script created a new directory named `mb-output` (like we asked above),
which contains a compressed tarball of all MrBayes output: `mb-output/1_seqgen.mb.tar`
```
$ tar -tf mb-output/1_seqgen.mb.tar
1_seqgen12.nex.tar.gz
1_seqgen11.nex.tar.gz
1_seqgen10.nex.tar.gz
...
1_seqgen7.nex.tar.gz
1_seqgen8.nex.tar.gz
1_seqgen9.nex.tar.gz
```
with the output of each locus.

We won't look at the output files, but if you want instructions on how to untar to see them, check [here]().

NOTE: We are using MrBayes here, but we could use any method to estimate gene trees.

## 4. Running BUCKy on the posterior distributions of gene trees

```
$ ../scripts/bucky.pl mb-output/1_seqgen.mb.tar -o bucky-output

Checking for BUCKy version >= 1.4.4...
  BUCKy version: 1.4.4.
  BUCKy version check passed.

Script was called as follows:
perl bucky.pl mb-output/1_seqgen.mb.tar -o bucky-output

Found 6 taxa shared across all genes in this archive, 15 of 15 possible quartets will be run using output from 30 total genes.
Summarizing MrBayes output for 30 genes.
Job server successfully created.

  Analyses complete: 15/15.
  All connections closed.
Total execution time: 57 seconds.
```
The script created a new directory named `bucky-output` (like we asked above), which contains
several tarballs (results from MrBayes, mbsum and from bucky).

The script created a new directory named `bucky-output` (like we asked above), which contains
several tarballs (results from MrBayes, mbsum and from bucky)
```
$ ls
astral	bucky-output  input  mb-output	raxml  snaq

$ ls bucky-output/
1_seqgen.BUCKy.tar  1_seqgen.mb.tar
1_seqgen.CFs.csv    1_seqgen.mbsum.tar.gz
```
The `.csv` file (spreadsheet) lists all the 4-taxon sets and their estimated quartet
concordance factors which will be the input for SNaQ.

NOTE: We use BUCKy to account for gene tree estimation error, but we could skip this step and use gene trees directly as input in snaq.

## 5. Estimating a population tree with Quartet MaxCut

The optimization algorithm within SNaQ is complex, so a good starting point to help the search in network space would improve the accuracy and running time.

We will use Quartet MaxCut (QMC) to estimating a starting population tree because the input data for QMC is the same table of concordance factors.

```
$ ../scripts/get-pop-tree.pl bucky-output/1_seqgen.CFs.csv

Script was called as follows:
perl get-pop-tree.pl bucky-output/1_seqgen.CFs.csv

Parsing major resolution of each 4-taxon set... done.
Running Quartet Max Cut...

Quartet MaxCut version 2.10 by Sagi Snir, University of Haifa
quartet file is 1_seqgen.QMC.txt,
Number of quartets is 15, max element 6
Number of quartets read: 15, max ele 6
Started working at  Mon May 23 09:44:12 2016
Ended working at  Mon May 23 09:44:12 2016

Quartet Max Cut complete, tree located in '1_seqgen.QMC.tre'.
```

We have a new file `1_seqgen.QMC.tre` with our QMC tree.


## 6. Running SNaQ

To run SNaQ, you need
- data extracted from sequence alignments:
  - a list of estimated **unrooted** gene trees, or
  - a table of concordance factors (CF) (e.g. from BUCKy)
- a starting topology (e.g. from Quartet MaxCut or ASTRAL, or RAxML tree from a single gene...)

Loading the Julia packages in Julia:
```julia
using PhyloNetworks
using PhyloPlots
```

### 6.1 Read the CF table into Julia:
```julia
buckyCF = readTableCF("bucky-output/1_seqgen.CFs.csv")
```

For the commands to read estimated gene trees, see [here]().

### 6.2 Read the starting population tree into Julia:
```julia
tre = readTopology("bucky-output/1_seqgen.QMC.tre")
```

### 6.3 Estimate the best network for a number of hybridizations
Estimate the best network from bucky's quartet CF and `hmax` number of hybridizations (make sure to have a folder called `snaq` in the working directory):
```julia
net0 = snaq!(tre,  buckyCF, hmax=0, filename="snaq/net0_bucky", seed=123)
net1 = snaq!(net0, buckyCF, hmax=1, filename="snaq/net1_bucky", seed=456)
```

To use multiple threads while running snaq, see [here]().

NOTE: Increase the number of hybridizations sequentially:
`hmax=0,1,2,...`, and use the best network at `h-1` as starting
point to estimate the best network at `h`.

### 6.4 Plot the estimated network

NOTE: Recall that the produced network is semi-directed, not rooted.
```julia
rootatnode!(net1, "6")
```

NOTE: If you cannot root at your outgroup, make sure to check the `.networks` file for alternative networks that could have a similar pseudolik score.

```
xxx
```

Plotting the estimated networks:
```julia
using PhyloPlots
plot(net1, :R);
```
again, if a plot window didn't pop up, an alternative is to save the plot
as a pdf and open it outside of julia:

```julia
R"pdf"("plot-net1.pdf", width=3, height=3);
plot(net1, :R);
R"dev.off()";
```

NOTE: Ghost lineages are a thing!

## 7. Bootstrapping

You need as input:

- data from sequence alignment that capture uncertainty:
  - credibility intervals for quartet concordance factors, from TICR
  - bootstrap gene trees from RAxML (same format that ASTRAL uses)
- a starting topology

### 7.1 Reading in data

We will focus on the case of CF credibility intervals:

```julia
using CSV, DataFrames
buckyDat = CSV.read("bucky-output/1_seqgen.CFs.csv") # names like: CF12.34, CF12.34_lo etc.
rename!(buckyDat, Symbol("CF12.34") => :CF12_34)     # bootsnaq requires these colunm names
rename!(x -> Symbol(replace(String(x), "." => "_")), buckyDat) # do all in one go
```

### 7.2 Running bootstrap
```julia
bootnet = bootsnaq(net0, buckyDat, hmax=1, nrep=50, runs=3,
                   filename="snaq/bootsnaq1_buckyCI")
```

These settings are to make calculations faster. For a real data set,
up the number of bootstrap replicates to 100 or more, by changing `nrep`.
Also increase the number of independent search runs per replicate, `runs`
or just remove the `runs` option to get the default 10 runs.


### 7.3 Bootstrap summary

NOTE: If you close your session after having generated these bootstrap networks, you can
read them from the output file later, in a new session.
This output file ends in `.out`, so you would do this:
```julia
bootnet = readMultiTopology("snaq/bootsnaq1_buckyCI.out");
```

To make summaries, it's best to re-read the reference network (best,
estimated network) from file, to get a consistent numbering of nodes and edges.
Here, we re-read from file, re-root the network correctly.

```julia
net1 = readTopology("snaq/net1_bucky.out")
rootatnode!(net1, "6")
```

#### 7.3.1 Bootstrap summary of tree edges

Same as with species tree, we simply count the number of times each edge in the major tree from the estimated network appears in the bootstrap major trees.

```julia
BSe_tree, tree1 = treeEdgesBootstrap(bootnet,net1)
show(BSe_tree, allrows=true)
BSe_tree[BSe_tree[:proportion] .< 1.0, :]
```
where `tree1` is the major tree in `net1` (the best network estimated with the original data)
and `BSe_tree` is a data frame with the bootstrap support that each tree edge is found
in the major tree.

[add output here to interpret]

We can plot this information on the estimated network.
The command will only label the edges with
bootstrap support less than 100%.

```julia
plot(net1,  :R, edgeLabel=BSe_tree[BSe_tree[:proportion] .< 100.0, :]);
```

#### 7.3.2 Bootstrap summary of hybridization events

We focus on three types of clades:
- hybrid clade: hardwired cluster (descendants) of either hybrid edge
- major sister clade: hardwired cluster of the sibling edge of the major hybrid edge
- minor sister clade: hardwired cluster of the sibling edge of the minor hybrid edge

<br><img src="images/hybridBSexplain.png" width="403">

```julia
BSn, BSe, BSc, BSgam, BSedgenum = hybridBootstrapSupport(bootnet, net1);
```
- `BSn` is a table of bootstrap frequencies associated with **n**odes
- `BSe` is a table of bootstrap frequencies associated with **e**dges, and
- `BSc` describes the makeup of all **c**lades.

[wait to run actual analysis to interpret]