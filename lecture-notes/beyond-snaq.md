---
layout: default
title: Beyond SNaQ
nav_order: 7
---

# Beyond SNaQ: which tool for which question

SNaQ estimates a phylogenetic network by pseudolikelihood from gene trees or
concordance factors (CFs). It worked well for the data in this tutorial, but its
run time grows quickly with the number of taxa, and sometimes you only need a
quick answer. Two other tools from our group use the same kind of input (gene
trees or CFs) and can help in those cases.

| If you need... | Use | Start here |
|:--|:--|:--|
| A network with inheritance probabilities (γ) and branch lengths, on a moderate number of taxa | SNaQ | This tutorial |
| A network on many taxa (tens to hundreds) | InPhyNet | [Empirical example](https://nathankolbow.github.io/InPhyNet.jl/stable/empirical/) |
| A fast first look at which taxa are involved in a hybridization | PhyloDiamond | [Quick start](https://solislemuslab.github.io/PhyloDiamond.jl/stable/man/quickstart/), [Input and output](https://solislemuslab.github.io/PhyloDiamond.jl/stable/man/input_output/) |

## If you need a network on many taxa → use InPhyNet

SNaQ slows down quickly as you add taxa. For example, a single SNaQ run with
one hybridization on 14 taxa took about 13 minutes, so a network on hundreds of
taxa is out of reach.
[InPhyNet](https://github.com/NathanKolbow/InPhyNet.jl) splits the taxa into
small subsets and infers a network on each subset, for example with SNaQ. It
then merges these networks into a single network on all taxa.

Keep in mind that InPhyNet cannot find hybridizations between taxa in
different subsets, and the merged network has no branch lengths.

To see the full workflow on real data, see the
[InPhyNet empirical example](https://nathankolbow.github.io/InPhyNet.jl/stable/empirical/).
It infers a network on 203 butterfly and moth taxa from 1,930 gene trees.

## If you need a fast first look → use PhyloDiamond

[PhyloDiamond](https://github.com/solislemuslab/PhyloDiamond.jl) finds where a
hybridization happened: the hybrid clade and its two parent clades. It uses
algebraic invariants instead of likelihood, which makes it very fast. On the
*Canis* data in its paper, it took 7 seconds, compared with 2 minutes for SNaQ.

Use it to narrow thousands of candidate networks down to a few. Then compare
those candidates with SNaQ, which also estimates inheritance probabilities and
branch lengths. PhyloDiamond needs at least 6 taxa and assumes a single
hybridization cycle with 4 nodes.

- [Quick start](https://solislemuslab.github.io/PhyloDiamond.jl/stable/man/quickstart/): install PhyloDiamond and run it on an example.
- [Input and output](https://solislemuslab.github.io/PhyloDiamond.jl/stable/man/input_output/): use your own gene trees or CFs, and read the results.

## If you need γ, branch lengths and more than one hybridization → stay with SNaQ

For a moderate number of taxa, SNaQ remains the method of choice:

- It estimates inheritance probabilities and branch lengths.
- It allows several hybridizations.
- You can choose the number of hybridizations as shown in
  [Phylogenetic networks with SNaQ](https://solislemuslab.github.io/snaq-tutorial/lecture-notes/lecture4.html).

It also complements the other two tools. You can use SNaQ to infer the subset
networks for InPhyNet, and to compare the candidate networks from PhyloDiamond.
