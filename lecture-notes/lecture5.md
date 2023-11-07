---
layout: default
title: Trait evolution
nav_order: 7
---

# Trait evolution on phylogenetic networks

We assume a fixed network, correctly rooted, with branch lengths proportional to calendar time. Note that SNaQ will estimate branches in coalescent units, and we need to calibrate the network so that branches are proportional to calendar time. We will skip this step here and provide the calibrated network, but you can do this calibration with what you learned in the workshop about BPP.

```julia
net1 = readTopology("net1_snaq.out")
rootatnode!(net1, "Smi165")
```
