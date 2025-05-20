---
layout: default
title: TICR pipeline
nav_order: 4
---

# From alignments to concordance factors with the TICR pipeline

# 1. Estimating gene trees with MrBayes

## 1.1 Input for MrBayes

You need to write a MrBayes block with the parameters for MrBayes.
Here, we provide a MrBayes block in [`mbblock.txt`](https://github.com/JuliaPhylo/PhyloUtilities/blob/main/scripts/mbblock.txt) from the [TICR repo](https://github.com/nstenz/TICR):

```
$ cd TICR/example
$ cat mbblock.txt
begin mrbayes;
	set nowarnings=yes;
	set autoclose=yes;
	lset nst=2;
	mcmcp ngen=100000 burninfrac=.25 samplefreq=50 printfreq=10000 [increase these for real]
  diagnfreq=10000 nruns=2 nchains=2 temp=0.40 swapfreq=10;       [increase for real analysis]mcmc;
  sumt;
	mcmc; 
end;
```

{: .highlight }
Make sure to increase the number of generations (`ngen`) and to modify the other chain parameters for your real analysis.

## 1.2 Running MrBayes

We are ready to analyze all loci with MrBayes.

Recall that the main working directory (`scratch` or `my-analysis`) has the structure:

- `scratch` (or `my-analysis`)
    - `snaq-tutorial` (with the  new `analysis` folder)
    -  `PhyloUtilities` (with the scripts)

We want to be in the folder with the data:

```
cd snaq-tutorial/analysis
```

In this folder, we want to copy the MrBayes block:

```
cp ../../PhyloUtilities/scripts/mbblock.txt .
```

```
$ ../../PhyloUtilities/scripts/mb.pl nexus.tar.gz -m mbblock.txt -o mb-output

Script was called as follows:
perl mb.pl nexus.tar.gz -m mbblock.txt -o mb-output

Appending MrBayes block to each gene... done.

Job server successfully created.

  Analyses complete: 372/372.
  All connections closed.
Total execution time: 12 minutes, 27 seconds.
```

## 1.3 Output for MrBayes

The script created a new directory named `mb-output` (as specified in the command),
which contains a compressed tarball of all MrBayes output: `mb-output/nexus.mb.tar`. We won't look at the output files, but if you want instructions on how to untar to see them, check [the PhyloUtilities website](https://juliaphylo.github.io/PhyloUtilities/notebooks/Gene-Trees-MrBayes.html).


We want to check convergence of the runs with (details of this command can be found in the [TICR repo](https://github.com/nstenz/TICR)):
```
../../PhyloUtilities/scripts/mb.pl mb-output -c 0.05
```

We get the output:

```
MrBayes results available for 372 total genes:
  0.nex.tar.gz  : 0.008404
  1.nex.tar.gz  : 0.003972
  2.nex.tar.gz  : 0.010326
  3.nex.tar.gz  : 0.006065
  4.nex.tar.gz  : 0.004270
  5.nex.tar.gz  : 0.012918
  6.nex.tar.gz  : 0.005891
  7.nex.tar.gz  : 0.007911
  8.nex.tar.gz  : 0.011182
  9.nex.tar.gz  : 0.006456
  10.nex.tar.gz : 0.020304
  11.nex.tar.gz : 0.002545
  12.nex.tar.gz : 0.000892
  13.nex.tar.gz : 0.004311
  14.nex.tar.gz : 0.015637
  15.nex.tar.gz : 0.006034
  16.nex.tar.gz : 0.045463
  17.nex.tar.gz : 0.005502
  18.nex.tar.gz : 0.012064
  19.nex.tar.gz : 0.006001
  20.nex.tar.gz : 0.006912
  21.nex.tar.gz : 0.004215
  22.nex.tar.gz : 0.000471
  23.nex.tar.gz : 0.007386
  24.nex.tar.gz : 0.005687
  25.nex.tar.gz : 0.005101
  26.nex.tar.gz : 0.004211
  27.nex.tar.gz : 0.002796
  28.nex.tar.gz : 0.003882
  29.nex.tar.gz : 0.007405
  30.nex.tar.gz : 0.000785
  31.nex.tar.gz : 0.003428
  32.nex.tar.gz : 0.008115
  33.nex.tar.gz : 0.016229
  34.nex.tar.gz : 0.006179
  35.nex.tar.gz : 0.006960
  36.nex.tar.gz : 0.015773
  37.nex.tar.gz : 0.004938
  38.nex.tar.gz : 0.006480
  39.nex.tar.gz : 0.005311
  40.nex.tar.gz : 0.005746
  41.nex.tar.gz : 0.002670
  42.nex.tar.gz : 0.004320
  43.nex.tar.gz : 0.005487
  44.nex.tar.gz : 0.003707
  45.nex.tar.gz : 0.008095
  46.nex.tar.gz : 0.001948
  47.nex.tar.gz : 0.006394
  48.nex.tar.gz : 0.003927
  49.nex.tar.gz : 0.073622
  50.nex.tar.gz : 0.004490
  51.nex.tar.gz : 0.005794
  52.nex.tar.gz : 0.024522
  53.nex.tar.gz : 0.001744
  54.nex.tar.gz : 0.007799
  55.nex.tar.gz : 0.004663
  56.nex.tar.gz : 0.008674
  57.nex.tar.gz : 0.007055
  58.nex.tar.gz : 0.007422
  59.nex.tar.gz : 0.024262
  60.nex.tar.gz : 0.007691
  61.nex.tar.gz : 0.004271
  62.nex.tar.gz : 0.005841
  63.nex.tar.gz : 0.003888
  64.nex.tar.gz : 0.006199
  65.nex.tar.gz : 0.011478
  66.nex.tar.gz : 0.002003
  67.nex.tar.gz : 0.004661
  68.nex.tar.gz : 0.017043
  69.nex.tar.gz : 0.007706
  70.nex.tar.gz : 0.007038
  71.nex.tar.gz : 0.003634
  72.nex.tar.gz : 0.006210
  73.nex.tar.gz : 0.001704
  74.nex.tar.gz : 0.005985
  75.nex.tar.gz : 0.258608
  76.nex.tar.gz : 0.002633
  77.nex.tar.gz : 0.026598
  78.nex.tar.gz : 0.004639
  79.nex.tar.gz : 0.010828
  80.nex.tar.gz : 0.006947
  81.nex.tar.gz : 0.007614
  82.nex.tar.gz : 0.005631
  83.nex.tar.gz : 0.330515
  84.nex.tar.gz : 0.005616
  85.nex.tar.gz : 0.005627
  86.nex.tar.gz : 0.012935
  87.nex.tar.gz : 0.166260
  88.nex.tar.gz : 0.005143
  89.nex.tar.gz : 0.004061
  90.nex.tar.gz : 0.006205
  91.nex.tar.gz : 0.020998
  92.nex.tar.gz : 0.001445
  93.nex.tar.gz : 0.006037
  94.nex.tar.gz : 0.006861
  95.nex.tar.gz : 0.010697
  96.nex.tar.gz : 0.004464
  97.nex.tar.gz : 0.005593
  98.nex.tar.gz : 0.012156
  99.nex.tar.gz : 0.001822
  100.nex.tar.gz: 0.002089
  101.nex.tar.gz: 0.008157
  102.nex.tar.gz: 0.004877
  103.nex.tar.gz: 0.006332
  104.nex.tar.gz: 0.003313
  105.nex.tar.gz: 0.003186
  106.nex.tar.gz: 0.010525
  107.nex.tar.gz: 0.006692
  108.nex.tar.gz: 0.006362
  109.nex.tar.gz: 0.007441
  110.nex.tar.gz: 0.004290
  111.nex.tar.gz: 0.004849
  112.nex.tar.gz: 0.004435
  113.nex.tar.gz: 0.002755
  114.nex.tar.gz: 0.001602
  115.nex.tar.gz: 0.002388
  116.nex.tar.gz: 0.006761
  117.nex.tar.gz: 0.015125
  118.nex.tar.gz: 0.041567
  119.nex.tar.gz: 0.004015
  120.nex.tar.gz: 0.007964
  121.nex.tar.gz: 0.003676
  122.nex.tar.gz: 0.006461
  123.nex.tar.gz: 0.007245
  124.nex.tar.gz: 0.005796
  125.nex.tar.gz: 0.020264
  126.nex.tar.gz: 0.005581
  127.nex.tar.gz: 0.004589
  128.nex.tar.gz: 0.006057
  129.nex.tar.gz: 0.007540
  130.nex.tar.gz: 0.007983
  131.nex.tar.gz: 0.003396
  132.nex.tar.gz: 0.009551
  133.nex.tar.gz: 0.003240
  134.nex.tar.gz: 0.011938
  135.nex.tar.gz: 0.015596
  136.nex.tar.gz: 0.028200
  137.nex.tar.gz: 0.000634
  138.nex.tar.gz: 0.005074
  139.nex.tar.gz: 0.007229
  140.nex.tar.gz: 0.008499
  141.nex.tar.gz: 0.006705
  142.nex.tar.gz: 0.003756
  143.nex.tar.gz: 0.008511
  144.nex.tar.gz: 0.011433
  145.nex.tar.gz: 0.005089
  146.nex.tar.gz: 0.004175
  147.nex.tar.gz: 0.033313
  148.nex.tar.gz: 0.005147
  149.nex.tar.gz: 0.011441
  150.nex.tar.gz: 0.009593
  151.nex.tar.gz: 0.007187
  152.nex.tar.gz: 0.010866
  153.nex.tar.gz: 0.004449
  154.nex.tar.gz: 0.009454
  155.nex.tar.gz: 0.005355
  156.nex.tar.gz: 0.000652
  157.nex.tar.gz: 0.004830
  158.nex.tar.gz: 0.010633
  159.nex.tar.gz: 0.006209
  160.nex.tar.gz: 0.002859
  161.nex.tar.gz: 0.006403
  162.nex.tar.gz: 0.021987
  163.nex.tar.gz: 0.003489
  164.nex.tar.gz: 0.005756
  165.nex.tar.gz: 0.008196
  166.nex.tar.gz: 0.007049
  167.nex.tar.gz: 0.006362
  168.nex.tar.gz: 0.002190
  169.nex.tar.gz: 0.000652
  170.nex.tar.gz: 0.027653
  171.nex.tar.gz: 0.007181
  172.nex.tar.gz: 0.006205
  173.nex.tar.gz: 0.004973
  174.nex.tar.gz: 0.002827
  175.nex.tar.gz: 0.005827
  176.nex.tar.gz: 0.005446
  177.nex.tar.gz: 0.003534
  178.nex.tar.gz: 0.003204
  179.nex.tar.gz: 0.005581
  180.nex.tar.gz: 0.008524
  181.nex.tar.gz: 0.006611
  182.nex.tar.gz: 0.006951
  183.nex.tar.gz: 0.005850
  184.nex.tar.gz: 0.005289
  185.nex.tar.gz: 0.007582
  186.nex.tar.gz: 0.002341
  187.nex.tar.gz: 0.002686
  188.nex.tar.gz: 0.012507
  189.nex.tar.gz: 0.004061
  190.nex.tar.gz: 0.005529
  191.nex.tar.gz: 0.002199
  192.nex.tar.gz: 0.003344
  193.nex.tar.gz: 0.000673
  194.nex.tar.gz: 0.006899
  195.nex.tar.gz: 0.007742
  196.nex.tar.gz: 0.006886
  197.nex.tar.gz: 0.022006
  198.nex.tar.gz: 0.003968
  199.nex.tar.gz: 0.005581
  200.nex.tar.gz: 0.004323
  201.nex.tar.gz: 0.006676
  202.nex.tar.gz: 0.008141
  203.nex.tar.gz: 0.006625
  204.nex.tar.gz: 0.006440
  205.nex.tar.gz: 0.003841
  206.nex.tar.gz: 0.009490
  207.nex.tar.gz: 0.005738
  208.nex.tar.gz: 0.001498
  209.nex.tar.gz: 0.001665
  210.nex.tar.gz: 0.004214
  211.nex.tar.gz: 0.002315
  212.nex.tar.gz: 0.003635
  213.nex.tar.gz: 0.009543
  214.nex.tar.gz: 0.003755
  215.nex.tar.gz: 0.002345
  216.nex.tar.gz: 0.000580
  217.nex.tar.gz: 0.002283
  218.nex.tar.gz: 0.002469
  219.nex.tar.gz: 0.003521
  220.nex.tar.gz: 0.003215
  221.nex.tar.gz: 0.004178
  222.nex.tar.gz: 0.004539
  223.nex.tar.gz: 0.002121
  224.nex.tar.gz: 0.005905
  225.nex.tar.gz: 0.003487
  226.nex.tar.gz: 0.121647
  227.nex.tar.gz: 0.004724
  228.nex.tar.gz: 0.014636
  229.nex.tar.gz: 0.007938
  230.nex.tar.gz: 0.005395
  231.nex.tar.gz: 0.001555
  232.nex.tar.gz: 0.005667
  233.nex.tar.gz: 0.005648
  234.nex.tar.gz: 0.006205
  235.nex.tar.gz: 0.001834
  236.nex.tar.gz: 0.009178
  237.nex.tar.gz: 0.009624
  238.nex.tar.gz: 0.013141
  239.nex.tar.gz: 0.003181
  240.nex.tar.gz: 0.005983
  241.nex.tar.gz: 0.016494
  242.nex.tar.gz: 0.003063
  243.nex.tar.gz: 0.004114
  244.nex.tar.gz: 0.019036
  245.nex.tar.gz: 0.006715
  246.nex.tar.gz: 0.008731
  247.nex.tar.gz: 0.002971
  248.nex.tar.gz: 0.007335
  249.nex.tar.gz: 0.002749
  250.nex.tar.gz: 0.006541
  251.nex.tar.gz: 0.011128
  252.nex.tar.gz: 0.006588
  253.nex.tar.gz: 0.002814
  254.nex.tar.gz: 0.002827
  255.nex.tar.gz: 0.002003
  256.nex.tar.gz: 0.001555
  257.nex.tar.gz: 0.004383
  258.nex.tar.gz: 0.006201
  259.nex.tar.gz: 0.009979
  260.nex.tar.gz: 0.014990
  261.nex.tar.gz: 0.011752
  262.nex.tar.gz: 0.011274
  263.nex.tar.gz: 0.003243
  264.nex.tar.gz: 0.005207
  265.nex.tar.gz: 0.008594
  266.nex.tar.gz: 0.005920
  267.nex.tar.gz: 0.005757
  268.nex.tar.gz: 0.007471
  269.nex.tar.gz: 0.005666
  270.nex.tar.gz: 0.006597
  271.nex.tar.gz: 0.005726
  272.nex.tar.gz: 0.007832
  273.nex.tar.gz: 0.005364
  274.nex.tar.gz: 0.005600
  275.nex.tar.gz: 0.030423
  276.nex.tar.gz: 0.003741
  277.nex.tar.gz: 0.007501
  278.nex.tar.gz: 0.004536
  279.nex.tar.gz: 0.006362
  280.nex.tar.gz: 0.006435
  281.nex.tar.gz: 0.006287
  282.nex.tar.gz: 0.003842
  283.nex.tar.gz: 0.004663
  284.nex.tar.gz: 0.001582
  285.nex.tar.gz: 0.004957
  286.nex.tar.gz: 0.027391
  287.nex.tar.gz: 0.004385
  288.nex.tar.gz: 0.003299
  289.nex.tar.gz: 0.013534
  290.nex.tar.gz: 0.003786
  291.nex.tar.gz: 0.006461
  292.nex.tar.gz: 0.005778
  293.nex.tar.gz: 0.005140
  294.nex.tar.gz: 0.031477
  295.nex.tar.gz: 0.003393
  296.nex.tar.gz: 0.004055
  297.nex.tar.gz: 0.004355
  298.nex.tar.gz: 0.003988
  299.nex.tar.gz: 0.012357
  300.nex.tar.gz: 0.002315
  301.nex.tar.gz: 0.005251
  302.nex.tar.gz: 0.002577
  303.nex.tar.gz: 0.006806
  304.nex.tar.gz: 0.007930
  305.nex.tar.gz: 0.012183
  306.nex.tar.gz: 0.004129
  307.nex.tar.gz: 0.005166
  308.nex.tar.gz: 0.004047
  309.nex.tar.gz: 0.005882
  310.nex.tar.gz: 0.007147
  311.nex.tar.gz: 0.045486
  312.nex.tar.gz: 0.008107
  313.nex.tar.gz: 0.009618
  314.nex.tar.gz: 0.003637
  315.nex.tar.gz: 0.002289
  316.nex.tar.gz: 0.006670
  317.nex.tar.gz: 0.005779
  318.nex.tar.gz: 0.001750
  319.nex.tar.gz: 0.018932
  320.nex.tar.gz: 0.004887
  321.nex.tar.gz: 0.008093
  322.nex.tar.gz: 0.006452
  323.nex.tar.gz: 0.015659
  324.nex.tar.gz: 0.003386
  325.nex.tar.gz: 0.008097
  326.nex.tar.gz: 0.002962
  327.nex.tar.gz: 0.000956
  328.nex.tar.gz: 0.007952
  329.nex.tar.gz: 0.013827
  330.nex.tar.gz: 0.005720
  331.nex.tar.gz: 0.001704
  332.nex.tar.gz: 0.005920
  333.nex.tar.gz: 0.011864
  334.nex.tar.gz: 0.012763
  335.nex.tar.gz: 0.006663
  336.nex.tar.gz: 0.004560
  337.nex.tar.gz: 0.005724
  338.nex.tar.gz: 0.025426
  339.nex.tar.gz: 0.005296
  340.nex.tar.gz: 0.111822
  341.nex.tar.gz: 0.006921
  342.nex.tar.gz: 0.007060
  343.nex.tar.gz: 0.021951
  344.nex.tar.gz: 0.006315
  345.nex.tar.gz: 0.018638
  346.nex.tar.gz: 0.001696
  347.nex.tar.gz: 0.017267
  348.nex.tar.gz: 0.007676
  349.nex.tar.gz: 0.005320
  350.nex.tar.gz: 0.009351
  351.nex.tar.gz: 0.015969
  352.nex.tar.gz: 0.005057
  353.nex.tar.gz: 0.004182
  354.nex.tar.gz: 0.003452
  355.nex.tar.gz: 0.000308
  356.nex.tar.gz: 0.004061
  357.nex.tar.gz: 0.006352
  358.nex.tar.gz: 0.006899
  359.nex.tar.gz: 0.005364
  360.nex.tar.gz: 0.016444
  361.nex.tar.gz: 0.011251
  362.nex.tar.gz: 0.008269
  363.nex.tar.gz: 0.006016
  364.nex.tar.gz: 0.009048
  365.nex.tar.gz: 0.006813
  366.nex.tar.gz: 0.004241
  367.nex.tar.gz: 0.006854
  368.nex.tar.gz: 0.002055
  369.nex.tar.gz: 0.005239
  370.nex.tar.gz: 0.006021
  371.nex.tar.gz: 0.004851
6 gene(s) failed to meet the threshold of 0.05 (1.61%).
```

We can run the chain for longer to allow all genes to reach convergence, but for now, we will ignore the lack of convergence of 6 genes.

{: .warning }
The TICR repo has the option to delete the genes that did not converge, but it has an error and it can end up deleting the whole `mb-output` folder, so we are not running that option.

{: .note }
We are using MrBayes here, but we could use any method to estimate gene trees as described in the [PhyloUtilities website](https://juliaphylo.github.io/PhyloUtilities/notebooks/Gene-Trees-RAxML.html).

# 2. Running BUCKy on the posterior distributions of gene trees

We now run BUCKy to estimate the concordance factors from the posterior distributions of gene trees from MrBayes. This script will run BUCKy on every 4-taxon subset (1820 in this case for 16 taxa). Note that this analysis will take ~1 hour on a single laptop.

```
$ ../../TICR/scripts/bucky.pl mb-output/nexus.mb.tar -o bucky-output

Checking for BUCKy version >= 1.4.4...
  BUCKy version: 1.4.4.
  BUCKy version check passed.

Script was called as follows:
perl bucky.pl mb-output/nexus.mb.tar -o bucky-output

Found 16 taxa shared across all genes in this archive, 1820 of 1820 possible quartets will be run using output from 372 total genes.
Summarizing MrBayes output for 372 genes.
Could not determine external IP address, only local clients will be created.
Job server successfully created.

  Analyses complete: 1820/1820.
  All connections closed.
Total execution time: 48 minutes, 10 seconds.
```

## 2.1 Output for BUCKy

The script created a new directory named `bucky-output` (like we specified in the command above), which contains several tarballs (results from MrBayes, mbsum and from bucky).

```
$ ls bucky-output/
nexus.CFs.csv  nexus.mb.tar  nexus.mbsum.tar.gz
```
The `.csv` file (spreadsheet) lists all the 4-taxon sets and their estimated quartet
concordance factors which will be the input for SNaQ.

{: .note }
We use BUCKy to account for gene tree estimation error, but we could skip this step and use gene trees directly as input in SNaQ as described in the [PhyloUtilities website](https://juliaphylo.github.io/PhyloUtilities/notebooks/Gene-Trees-RAxML.html).

# 3. Estimating a population tree with Quartet MaxCut

The optimization algorithm within SNaQ is complex, so a good starting point to help the search in network space would improve the accuracy and running time.

We will use Quartet MaxCut (QMC) to estimate a starting population tree because the input data for QMC is the same table of concordance factors.

```
$ ../../PhyloUtilities/scripts/get-pop-tree.pl bucky-output/nexus.CFs.csv

Script was called as follows:
perl get-pop-tree.pl bucky-output/nexus.CFs.csv

Parsing major resolution of each 4-taxon set... done.
Running Quartet Max Cut...


Quartet MaxCut version 2.10 by Sagi Snir, University of Haifa

quartet file is nexus.QMC.txt, 

Number of quartets is 1820, max element 16

Number of quartets read: 1820, max ele 16

Quartet Max Cut complete, tree located in 'nexus.QMC.tre'.
```

We have a new file `nexus.QMC.tre` with our QMC tree.


# Final input files for SNaQ

We ran the following pipeline: From loci alignments in nexus file to estimated posterior distributions of gene trees with MrBayes, and then estimated concordance factors with BUCKy. The CFs were also used to estimate a starting topology for SNaQ with QMC.

The input for SNaQ will then be:
- starting topology in `nexus.QMC.tre`
- table of concordance factors in `nexus.CFs.csv`

We note that there is an alternative pipeline in which estimated gene trees are used as input directly for SNaQ. In this approach, we can estimate the gene trees with any method like [RAxML](https://github.com/amkozlov/raxml-ng) or [IQ-Tree](http://www.iqtree.org/), and it is described in the [PhyloUtilities website](https://juliaphylo.github.io/PhyloUtilities/notebooks/Gene-Trees-RAxML.html).

## Moving files out of the Docker container into local machine

For those running the commands in a Docker container, we need to bring back these output files into your local machine.

In your local machine (not inside the Docker container), type `docker ps` to get the Contained ID:
```
% docker ps
CONTAINER ID   IMAGE                      COMMAND       CREATED        STATUS        PORTS     NAMES
f9331b6cad1a   solislemus/ticr-docker:1   "/bin/bash"   18 hours ago   Up 18 hours             mystifying_banach
```

We are going to copy only the csv table and the starting tree with the command `docker cp containerID:/path/to/find/files /path/to/put/copy`.
Recall that you need to be outside of the Docker. We will copy these files inside `snaq-tutorial/analysis`
```
pwd ## snaq-tutorial/analysis
docker cp f9331b6cad1a:/scratch/snaq-tutorial/analysis/nexus.QMC.tre .
docker cp f9331b6cad1a:/scratch/snaq-tutorial/analysis/bucky-output/nexus.CFs.csv .
```

Once you exit the Docker container, it does not disappear (unless you ran it with the `rm` option which we did not). So, you can always log back into the Docker if you know the container ID. More information, see [here](https://stackoverflow.com/questions/28574433/do-docker-containers-retain-file-changes) or in the [Docker tutorial](https://www.docker.com/101-tutorial/).