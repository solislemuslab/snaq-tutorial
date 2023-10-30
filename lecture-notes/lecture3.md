---
layout: default
title: TICR pipeline
nav_order: 4
---

# From alignments to concordance factors with the TICR pipeline

# 1. Estimating gene trees with MrBayes

## 1.1 Input for MrBayes

You need to write a MrBayes block with the parameters for MrBayes.
Here, we provide a MrBayes block in [`mbblock.txt`](https://github.com/nstenz/TICR/blob/master/example/mb-block.txt) from the [TICR repo](https://github.com/nstenz/TICR):

```
$ cd TICR/example
$ cat mbblock.txt
begin mrbayes;
	set nowarnings=yes;
	set autoclose=yes;
	set seed=112491;
	set swapseed=1337;
	lset nst=6 rates=gamma;
	mcmcp ngen=200000 burninfrac=.25 samplefreq=200 printfreq=1000 diagnfreq=10000 nruns=3 nchains=3 temp=0.40 swapfreq=10;
	mcmc; 
end;
```

Make sure to increase the number of generations (`ngen`) and to modify the other chain parameters for your real analysis.

## 1.2 Running MrBayes

We are ready to analyze all loci with MrBayes.

Recall that the main working directory (`scratch` or `my-analysis`) has the structure:

- `scratch` (or `my-analysis`)
    - `snaq-tutorial` (with the  new `analysis` folder)
    -  `TICR` (with the scripts)

We want to be in the folder with the data:

```
cd snaq-tutorial/analysis
```

In this folder, we want to copy the MrBayes block:

```
cp ../../TICR/example/mb-block.txt .
```

```
$ ../../TICR/scripts/mb.pl nexus.tar.gz -m mb-block.txt -o mb-output

Script was called as follows:
perl mb.pl nexus.tar.gz -m mbblock.txt -o mb-output

Appending MrBayes block to each gene... done.

Job server successfully created.

  Analyses complete: 372/372.
  All connections closed.
Total execution time: 1 hour, 57 minutes, 4 seconds.
```

## 1.3 Output for MrBayes

The script created a new directory named `mb-output` (like we asked above),
which contains a compressed tarball of all MrBayes output: `mb-output/nexus.mb.tar`. We won't look at the output files, but if you want instructions on how to untar to see them, check [the PhyloNetworks wiki](https://github.com/crsl4/PhyloNetworks.jl/wiki/Gene-Trees:-MrBayes).


We want to check convergence of the runs with (details of this command can be found in the [TICR repo](https://github.com/nstenz/TICR)):
```
../../TICR/scripts/mb.pl mb-output -c 0.05
```

We get the output:

```
MrBayes results available for 372 total genes:
  0.nex.tar.gz  : 0.009339
  1.nex.tar.gz  : 0.013518
  2.nex.tar.gz  : 0.014948
  3.nex.tar.gz  : 0.009737
  4.nex.tar.gz  : 0.012187
  5.nex.tar.gz  : 0.012432
  6.nex.tar.gz  : 0.007308
  7.nex.tar.gz  : 0.013676
  8.nex.tar.gz  : 0.014463
  9.nex.tar.gz  : 0.011934
  10.nex.tar.gz : 0.012245
  11.nex.tar.gz : 0.007778
  12.nex.tar.gz : 0.004098
  13.nex.tar.gz : 0.009621
  14.nex.tar.gz : 0.008836
  15.nex.tar.gz : 0.011315
  16.nex.tar.gz : 0.032953
  17.nex.tar.gz : 0.011602
  18.nex.tar.gz : 0.018016
  19.nex.tar.gz : 0.009301
  20.nex.tar.gz : 0.017236
  21.nex.tar.gz : 0.008698
  22.nex.tar.gz : 0.005397
  23.nex.tar.gz : 0.205261
  24.nex.tar.gz : 0.010576
  25.nex.tar.gz : 0.007037
  26.nex.tar.gz : 0.011003
  27.nex.tar.gz : 0.004304
  28.nex.tar.gz : 0.007650
  29.nex.tar.gz : 0.013461
  30.nex.tar.gz : 0.006423
  31.nex.tar.gz : 0.013378
  32.nex.tar.gz : 0.011443
  33.nex.tar.gz : 0.018124
  34.nex.tar.gz : 0.011227
  35.nex.tar.gz : 0.013071
  36.nex.tar.gz : 0.014382
  37.nex.tar.gz : 0.008166
  38.nex.tar.gz : 0.014007
  39.nex.tar.gz : 0.012676
  40.nex.tar.gz : 0.009052
  41.nex.tar.gz : 0.003385
  42.nex.tar.gz : 0.007412
  43.nex.tar.gz : 0.010273
  44.nex.tar.gz : 0.038163
  45.nex.tar.gz : 0.005651
  46.nex.tar.gz : 0.004457
  47.nex.tar.gz : 0.010520
  48.nex.tar.gz : 0.011837
  49.nex.tar.gz : 0.025388
  50.nex.tar.gz : 0.007262
  51.nex.tar.gz : 0.007285
  52.nex.tar.gz : 0.006994
  53.nex.tar.gz : 0.003820
  54.nex.tar.gz : 0.012244
  55.nex.tar.gz : 0.008809
  56.nex.tar.gz : 0.010009
  57.nex.tar.gz : 0.014042
  58.nex.tar.gz : 0.008967
  59.nex.tar.gz : 0.025128
  60.nex.tar.gz : 0.010323
  61.nex.tar.gz : 0.003934
  62.nex.tar.gz : 0.007758
  63.nex.tar.gz : 0.007556
  64.nex.tar.gz : 0.007920
  65.nex.tar.gz : 0.014156
  66.nex.tar.gz : 0.005579
  67.nex.tar.gz : 0.008610
  68.nex.tar.gz : 0.012942
  69.nex.tar.gz : 0.012334
  70.nex.tar.gz : 0.013032
  71.nex.tar.gz : 0.007713
  72.nex.tar.gz : 0.010846
  73.nex.tar.gz : 0.007544
  74.nex.tar.gz : 0.005354
  75.nex.tar.gz : 0.035109
  76.nex.tar.gz : 0.006520
  77.nex.tar.gz : 0.018321
  78.nex.tar.gz : 0.005410
  79.nex.tar.gz : 0.014672
  80.nex.tar.gz : 0.011011
  81.nex.tar.gz : 0.030514
  82.nex.tar.gz : 0.009818
  83.nex.tar.gz : 0.267835
  84.nex.tar.gz : 0.019695
  85.nex.tar.gz : 0.015109
  86.nex.tar.gz : 0.010809
  87.nex.tar.gz : 0.048233
  88.nex.tar.gz : 0.010913
  89.nex.tar.gz : 0.008628
  90.nex.tar.gz : 0.009416
  91.nex.tar.gz : 0.018063
  92.nex.tar.gz : 0.003539
  93.nex.tar.gz : 0.013522
  94.nex.tar.gz : 0.032754
  95.nex.tar.gz : 0.016011
  96.nex.tar.gz : 0.007937
  97.nex.tar.gz : 0.009941
  98.nex.tar.gz : 0.011187
  99.nex.tar.gz : 0.004516
  100.nex.tar.gz: 0.008209
  101.nex.tar.gz: 0.012973
  102.nex.tar.gz: 0.007583
  103.nex.tar.gz: 0.008764
  104.nex.tar.gz: 0.006509
  105.nex.tar.gz: 0.008043
  106.nex.tar.gz: 0.016243
  107.nex.tar.gz: 0.012861
  108.nex.tar.gz: 0.012487
  109.nex.tar.gz: 0.011229
  110.nex.tar.gz: 0.012057
  111.nex.tar.gz: 0.010564
  112.nex.tar.gz: 0.007734
  113.nex.tar.gz: 0.008324
  114.nex.tar.gz: 0.007423
  115.nex.tar.gz: 0.003319
  116.nex.tar.gz: 0.009322
  117.nex.tar.gz: 0.014921
  118.nex.tar.gz: 0.013895
  119.nex.tar.gz: 0.007771
  120.nex.tar.gz: 0.013780
  121.nex.tar.gz: 0.009373
  122.nex.tar.gz: 0.011048
  123.nex.tar.gz: 0.011310
  124.nex.tar.gz: 0.010840
  125.nex.tar.gz: 0.023989
  126.nex.tar.gz: 0.010832
  127.nex.tar.gz: 0.009026
  128.nex.tar.gz: 0.010296
  129.nex.tar.gz: 0.010788
  130.nex.tar.gz: 0.008839
  131.nex.tar.gz: 0.008131
  132.nex.tar.gz: 0.015833
  133.nex.tar.gz: 0.008647
  134.nex.tar.gz: 0.014395
  135.nex.tar.gz: 0.026447
  136.nex.tar.gz: 0.037417
  137.nex.tar.gz: 0.010495
  138.nex.tar.gz: 0.012617
  139.nex.tar.gz: 0.010212
  140.nex.tar.gz: 0.011439
  141.nex.tar.gz: 0.010456
  142.nex.tar.gz: 0.008663
  143.nex.tar.gz: 0.010631
  144.nex.tar.gz: 0.016540
  145.nex.tar.gz: 0.011046
  146.nex.tar.gz: 0.010332
  147.nex.tar.gz: 0.049809
  148.nex.tar.gz: 0.015237
  149.nex.tar.gz: 0.013824
  150.nex.tar.gz: 0.026949
  151.nex.tar.gz: 0.013499
  152.nex.tar.gz: 0.012399
  153.nex.tar.gz: 0.009255
  154.nex.tar.gz: 0.013248
  155.nex.tar.gz: 0.011093
  156.nex.tar.gz: 0.007049
  157.nex.tar.gz: 0.011650
  158.nex.tar.gz: 0.012577
  159.nex.tar.gz: 0.005092
  160.nex.tar.gz: 0.009025
  161.nex.tar.gz: 0.012108
  162.nex.tar.gz: 0.018455
  163.nex.tar.gz: 0.008697
  164.nex.tar.gz: 0.006339
  165.nex.tar.gz: 0.012933
  166.nex.tar.gz: 0.011018
  167.nex.tar.gz: 0.015809
  168.nex.tar.gz: 0.006736
  169.nex.tar.gz: 0.005098
  170.nex.tar.gz: 0.008388
  171.nex.tar.gz: 0.009398
  172.nex.tar.gz: 0.012826
  173.nex.tar.gz: 0.009147
  174.nex.tar.gz: 0.009661
  175.nex.tar.gz: 0.011081
  176.nex.tar.gz: 0.013713
  177.nex.tar.gz: 0.010641
  178.nex.tar.gz: 0.005521
  179.nex.tar.gz: 0.009436
  180.nex.tar.gz: 0.011073
  181.nex.tar.gz: 0.016073
  182.nex.tar.gz: 0.012786
  183.nex.tar.gz: 0.013103
  184.nex.tar.gz: 0.009184
  185.nex.tar.gz: 0.047294
  186.nex.tar.gz: 0.003981
  187.nex.tar.gz: 0.006436
  188.nex.tar.gz: 0.011649
  189.nex.tar.gz: 0.009204
  190.nex.tar.gz: 0.009873
  191.nex.tar.gz: 0.005324
  192.nex.tar.gz: 0.009041
  193.nex.tar.gz: 0.002294
  194.nex.tar.gz: 0.008449
  195.nex.tar.gz: 0.022155
  196.nex.tar.gz: 0.012000
  197.nex.tar.gz: 0.019169
  198.nex.tar.gz: 0.008682
  199.nex.tar.gz: 0.009984
  200.nex.tar.gz: 0.009721
  201.nex.tar.gz: 0.010147
  202.nex.tar.gz: 0.013584
  203.nex.tar.gz: 0.011039
  204.nex.tar.gz: 0.009465
  205.nex.tar.gz: 0.013672
  206.nex.tar.gz: 0.006584
  207.nex.tar.gz: 0.008654
  208.nex.tar.gz: 0.002594
  209.nex.tar.gz: 0.013212
  210.nex.tar.gz: 0.005305
  211.nex.tar.gz: 0.005515
  212.nex.tar.gz: 0.005834
  213.nex.tar.gz: 0.013848
  214.nex.tar.gz: 0.005935
  215.nex.tar.gz: 0.014987
  216.nex.tar.gz: 0.007839
  217.nex.tar.gz: 0.007078
  218.nex.tar.gz: 0.007203
  219.nex.tar.gz: 0.009033
  220.nex.tar.gz: 0.001980
  221.nex.tar.gz: 0.005890
  222.nex.tar.gz: 0.011740
  223.nex.tar.gz: 0.008596
  224.nex.tar.gz: 0.008092
  225.nex.tar.gz: 0.008112
  226.nex.tar.gz: 0.081806
  227.nex.tar.gz: 0.009092
  228.nex.tar.gz: 0.018873
  229.nex.tar.gz: 0.007198
  230.nex.tar.gz: 0.013729
  231.nex.tar.gz: 0.005816
  232.nex.tar.gz: 0.008676
  233.nex.tar.gz: 0.011591
  234.nex.tar.gz: 0.010746
  235.nex.tar.gz: 0.005023
  236.nex.tar.gz: 0.013577
  237.nex.tar.gz: 0.012358
  238.nex.tar.gz: 0.022312
  239.nex.tar.gz: 0.006509
  240.nex.tar.gz: 0.009456
  241.nex.tar.gz: 0.020078
  242.nex.tar.gz: 0.004209
  243.nex.tar.gz: 0.008158
  244.nex.tar.gz: 0.019615
  245.nex.tar.gz: 0.021060
  246.nex.tar.gz: 0.011180
  247.nex.tar.gz: 0.007676
  248.nex.tar.gz: 0.010113
  249.nex.tar.gz: 0.008066
  250.nex.tar.gz: 0.013339
  251.nex.tar.gz: 0.013388
  252.nex.tar.gz: 0.010239
  253.nex.tar.gz: 0.005281
  254.nex.tar.gz: 0.011113
  255.nex.tar.gz: 0.005331
  256.nex.tar.gz: 0.007156
  257.nex.tar.gz: 0.007416
  258.nex.tar.gz: 0.008506
  259.nex.tar.gz: 0.010507
  260.nex.tar.gz: 0.010068
  261.nex.tar.gz: 0.017176
  262.nex.tar.gz: 0.017568
  263.nex.tar.gz: 0.006934
  264.nex.tar.gz: 0.012923
  265.nex.tar.gz: 0.007264
  266.nex.tar.gz: 0.012550
  267.nex.tar.gz: 0.011008
  268.nex.tar.gz: 0.004069
  269.nex.tar.gz: 0.008713
  270.nex.tar.gz: 0.111154
  271.nex.tar.gz: 0.006536
  272.nex.tar.gz: 0.014474
  273.nex.tar.gz: 0.009833
  274.nex.tar.gz: 0.009332
  275.nex.tar.gz: 0.019504
  276.nex.tar.gz: 0.012686
  277.nex.tar.gz: 0.006510
  278.nex.tar.gz: 0.017137
  279.nex.tar.gz: 0.007696
  280.nex.tar.gz: 0.008693
  281.nex.tar.gz: 0.009419
  282.nex.tar.gz: 0.008997
  283.nex.tar.gz: 0.007456
  284.nex.tar.gz: 0.004255
  285.nex.tar.gz: 0.010553
  286.nex.tar.gz: 0.012943
  287.nex.tar.gz: 0.007364
  288.nex.tar.gz: 0.010224
  289.nex.tar.gz: 0.010093
  290.nex.tar.gz: 0.004452
  291.nex.tar.gz: 0.010442
  292.nex.tar.gz: 0.009371
  293.nex.tar.gz: 0.008003
  294.nex.tar.gz: 0.026161
  295.nex.tar.gz: 0.008017
  296.nex.tar.gz: 0.005575
  297.nex.tar.gz: 0.011752
  298.nex.tar.gz: 0.012697
  299.nex.tar.gz: 0.013401
  300.nex.tar.gz: 0.006272
  301.nex.tar.gz: 0.007165
  302.nex.tar.gz: 0.008288
  303.nex.tar.gz: 0.012696
  304.nex.tar.gz: 0.021104
  305.nex.tar.gz: 0.015852
  306.nex.tar.gz: 0.008958
  307.nex.tar.gz: 0.010688
  308.nex.tar.gz: 0.010504
  309.nex.tar.gz: 0.010065
  310.nex.tar.gz: 0.011865
  311.nex.tar.gz: 0.214476
  312.nex.tar.gz: 0.011281
  313.nex.tar.gz: 0.012302
  314.nex.tar.gz: 0.006381
  315.nex.tar.gz: 0.003490
  316.nex.tar.gz: 0.010327
  317.nex.tar.gz: 0.009634
  318.nex.tar.gz: 0.006812
  319.nex.tar.gz: 0.014343
  320.nex.tar.gz: 0.016176
  321.nex.tar.gz: 0.025270
  322.nex.tar.gz: 0.010764
  323.nex.tar.gz: 0.019377
  324.nex.tar.gz: 0.009645
  325.nex.tar.gz: 0.009543
  326.nex.tar.gz: 0.013120
  327.nex.tar.gz: 0.007635
  328.nex.tar.gz: 0.015228
  329.nex.tar.gz: 0.012889
  330.nex.tar.gz: 0.008354
  331.nex.tar.gz: 0.006059
  332.nex.tar.gz: 0.008232
  333.nex.tar.gz: 0.007971
  334.nex.tar.gz: 0.011804
  335.nex.tar.gz: 0.011550
  336.nex.tar.gz: 0.005060
  337.nex.tar.gz: 0.010823
  338.nex.tar.gz: 0.010894
  339.nex.tar.gz: 0.011595
  340.nex.tar.gz: 0.012036
  341.nex.tar.gz: 0.004678
  342.nex.tar.gz: 0.011952
  343.nex.tar.gz: 0.012584
  344.nex.tar.gz: 0.010342
  345.nex.tar.gz: 0.018922
  346.nex.tar.gz: 0.004644
  347.nex.tar.gz: 0.014068
  348.nex.tar.gz: 0.013585
  349.nex.tar.gz: 0.018521
  350.nex.tar.gz: 0.010793
  351.nex.tar.gz: 0.015810
  352.nex.tar.gz: 0.021953
  353.nex.tar.gz: 0.011974
  354.nex.tar.gz: 0.006764
  355.nex.tar.gz: 0.001233
  356.nex.tar.gz: 0.007092
  357.nex.tar.gz: 0.013936
  358.nex.tar.gz: 0.015627
  359.nex.tar.gz: 0.013749
  360.nex.tar.gz: 0.023445
  361.nex.tar.gz: 0.014645
  362.nex.tar.gz: 0.011432
  363.nex.tar.gz: 0.009269
  364.nex.tar.gz: 0.014100
  365.nex.tar.gz: 0.008385
  366.nex.tar.gz: 0.009302
  367.nex.tar.gz: 0.009936
  368.nex.tar.gz: 0.008902
  369.nex.tar.gz: 0.009984
  370.nex.tar.gz: 0.012166
  371.nex.tar.gz: 0.022356
5 gene(s) failed to meet the threshold of 0.05 (1.34%).
```

We can run the chain for longer to allow all genes to reach convergence, but for now, we will ignore the lack of convergence of 5 genes.

**Warning:** The TICR repo has the option to delete the genes that did not converge, but it has an error and it can end up deleting the whole `mb-output` folder, so we are not running that option.

**NOTE:** We are using MrBayes here, but we could use any method to estimate gene trees as we will see in the SNaQ section.

# 2. Running BUCKy on the posterior distributions of gene trees

```
$ ../../TICR/scripts/bucky.pl mb-output/nexus.mb.tar -o bucky-output

Checking for BUCKy version >= 1.4.4...
  BUCKy version: 1.4.4.
  BUCKy version check passed.

Script was called as follows:
perl bucky.pl mb-output/nexus.mb.tar -o bucky-output

Found 16 taxa shared across all genes in this archive, 1820 of 1820 possible quartets will be run using output from 372 total genes.
Summarizing MrBayes output for 372 genes.
Job server successfully created.
Use of uninitialized value $server_ip in scalar chomp at ../../TICR/scripts/bucky.pl line 456.
Use of uninitialized value $server_ip in pattern match (m//) at ../../TICR/scripts/bucky.pl line 457.
Could not determine external IP address, only local clients will be created.
Job server successfully created.

  Analyses complete: 1820/1820.
  All connections closed.
Total execution time: 3 hours, 35 minutes, 27 seconds.
```

## 2.1 Output for BUCKy

The script created a new directory named `bucky-output` (like we asked above), which contains several tarballs (results from MrBayes, mbsum and from bucky).

```
$ ls bucky-output/
nexus.CFs.csv  nexus.mb.tar  nexus.mbsum.tar.gz
```
The `.csv` file (spreadsheet) lists all the 4-taxon sets and their estimated quartet
concordance factors which will be the input for SNaQ.

**NOTE:** We use BUCKy to account for gene tree estimation error, but we could skip this step and use gene trees directly as input in SNaQ as described in the [PhyloNetworks wiki](https://github.com/crsl4/PhyloNetworks.jl/wiki/Gene-Trees:-RAxML).

# 3. Estimating a population tree with Quartet MaxCut

The optimization algorithm within SNaQ is complex, so a good starting point to help the search in network space would improve the accuracy and running time.

We will use Quartet MaxCut (QMC) to estimating a starting population tree because the input data for QMC is the same table of concordance factors.

```
$ ../../TICR/scripts/get-pop-tree.pl bucky-output/nexus.CFs.csv

Script was called as follows:
perl get-pop-tree.pl bucky-output/nexus.CFs.csv

Parsing major resolution of each 4-taxon set... done.
Running Quartet Max Cut...


Quartet MaxCut version 2.10 by Sagi Snir, University of Haifa

quartet file is nexus.QMC.txt, 

Number of quartets is 1820, max element 16

Number of quartets read: 1820, max ele 16

Started working at  Fri Oct 27 14:57:25 2023
Ended working at  Fri Oct 27 14:57:25 2023

Quartet Max Cut complete, tree located in 'nexus.QMC.tre'.
```

We have a new file `nexus.QMC.tre` with our QMC tree.


# Final input files for SNaQ

We ran the following pipeline: From loci alignments in nexus file to estimated posterior distributions of gene trees with MrBayes, and then estimated concordance factors with BUCKy. The CFs were also used to estimate a starting topology for SNaQ.

The input for SNaQ will then be:
- starting topology in `nexus.QMC.tre`
- table of concordance factors in `nexus.CFs.csv`

We note that there is an alternative pipeline in which estimated gene trees are used as input directly for SNaQ. In this approach, we can estimate the gene trees with any method like [RAxML](https://github.com/amkozlov/raxml-ng) or [IQ-Tree](http://www.iqtree.org/), and it is described in the [PhyloNetworks wiki](https://github.com/crsl4/PhyloNetworks.jl/wiki/Gene-Trees:-RAxML).

## Moving files out of the Docker container into local machine

For those running the commands in a Docker container, we need to bring back these output files into your local machine.

Not inside the docker, type `docker ps` to get the Contained ID:
```
% docker ps
CONTAINER ID   IMAGE                      COMMAND       CREATED        STATUS        PORTS     NAMES
f9331b6cad1a   solislemus/ticr-docker:1   "/bin/bash"   18 hours ago   Up 18 hours             mystifying_banach
```

We are going to copy only the csv table and the starting tree with the command `docker cp containerID:/path/to/find/files /path/to/put/copy`.
Recall that you need to be outside of the Docker. We will move inside `snaq-tutorial/analysis`
```
pwd ## snaq-tutorial/analysis
docker cp f9331b6cad1a:/scratch/snaq-tutorial/analysis/nexus.QMC.tre .
docker cp f9331b6cad1a:/scratch/snaq-tutorial/analysis/bucky-output/nexus.CFs.csv .
```

Once you exit the Docker container, it does not disappear (unless you ran it with the `rm` option which we did not). So, you can always log back into the Docker if you know the container ID. More information [here](https://stackoverflow.com/questions/28574433/do-docker-containers-retain-file-changes) or in the [Docker tutorial](https://www.docker.com/101-tutorial/).