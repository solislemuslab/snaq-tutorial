---
layout: default
title: Trait evolution
nav_order: 7
---

# Trait evolution on phylogenetic networks

We assume a fixed network, correctly rooted, with branch lengths proportional to calendar time:

```julia
net1 = readTopology("net1_snaq.out")
rootatnode!(net1, "Smi165")
```
