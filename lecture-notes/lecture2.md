---
layout: default
title: Data
nav_order: 4
---

# Data: Reticulate Evolution in Baobabs

We will be using the public data of [Karimi et al, 2020](https://academic.oup.com/sysbio/article/69/3/462/5613901) that consists of 371 aligned loci and 8 species of _Adansonia_ plus an outgroup:

-  _A. digitata_, continental Africa, 
-  _A. gregorii_, Australia,
- _A. grandidieri_, Madagascar,
- _A. suarezensis_, Madagascar,
- _A. madagascariensis_, Madagascar,
- _A. perrieri_, Madagascar,
- _A. za_, Madagascar, and
- _A. rubrostipa_, Madagascar.

<div style="text-align:center"><img src="../images/baobabs.jpeg" width="750"/></div>

_Image from Karimi et al (2020)_

The original data is in FASTA format (see [data/fasta-alignments](https://github.com/solislemuslab/snaq-tutorial/tree/main/data/fasta-alignments)), but we need NEXUS format to run MrBayes.

We have a julia script to convert FASTA to NEXUS in the repository ([convertFasta2Nexus.jl](https://github.com/solislemuslab/snaq-tutorial/blob/main/scripts/convertFasta2Nexus.jl)), but for the sake of time, the NEXUS files are already converted in the repository (see [data/nexus-alignments](https://github.com/solislemuslab/snaq-tutorial/tree/main/data/nexus-alignments)).

## Input data: Multi-locus sequences in nexus files

We need to compress the nexus files into a tar file:

```
pwd ## project directory or scratch if using docker
cd snaq-tutorial/data/nexus-alignments
tar czf nexus.tar.gz *.nex
```

This will create a tar file (`nexus.tar.gz`) with the nexus files.

**Important:** It is very important that you do not compress the whole folder. You should compress the individual files `*.nex`, not `nexus-alignments` or the TICR perl scripts will throw an error.

We will create a folder called `analysis` and move this input file there:

```
pwd ## inside data/nexus-alignments
cd ../..
mkdir analysis
mv data/nexus-alignments/nexus.tar.gz analysis
```

