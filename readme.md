# SNaQ Tutorial

This website has an alternative tutorial for SNaQ to the one in the [PhyloNetworks wiki](https://github.com/crsl4/PhyloNetworks.jl/wiki). Here, we use a Docker for the installation of Dependencies and we use a real dataset (baobabs) to illustrate the pipeline from multilocus alignments to phylogenetic network.

This learning materials were created as part of the workshop in the Kew Royal Botanical Gardens: [Methodological Advances in Reticulate Evolution](https://gtiley.github.io/RBG-Networks/about/) taught in November 2023.


## Learning outcomes

By the end of the tutorial, you will be able to
- estimate gene trees (and posterior distributions) from multilocus alignments with [MrBayes](http://nbisweden.github.io/MrBayes/)
- estimate concordance factors from the estimated posterior distributions with [BUCKy](http://pages.stat.wisc.edu/~ane/bucky/index.html)
- estimate a phylogenetic network from the estimated concordance factors with [SNaQ](https://github.com/crsl4/PhyloNetworks.jl)

## Installation of dependencies


We will not go over this section in the RBG workshop.

## Schedule

| Topic | Lecture notes | Time |
| :---:   | :---: | :---:       |
| 1. Theory: Estimating phylogenetic networks from multilocus alignments | [notes](https://solislemuslab.github.io/snaq-tutorial//lecture-notes/lecture1.html) | 13:00 - 15:00 |
| Break | | 15:00 - 15:30 |
| 2. How do we combine probabilities? | i) Product rule: we can calculate the probability of simultaneous events when they are independent; ii) Addition rule: we can calculate the probability of different disjoint events  |  [notes](https://crsl4.github.io/forensic-stat//lecture-notes/2combining-probs.html) |
| 3. How do we update probabilities when new information is available? | i) The conditional probability allows us to update a probability with new information; ii) Very important not to confuse the conditioning event as probabilities would change  |  [notes](https://crsl4.github.io/forensic-stat//lecture-notes/3updating-probs.html) |

## YouTube video of the lecture

You can find the 90-minute lecture including all three topics in [this link](https://youtu.be/ARq7fX41KPA).


## Meet the instructor

Claudia Sol&iacute;s-Lemus is an assistant professor at the [Wisconsin Institute for Discovery](https://wid.wisc.edu/) and the [Department of Plant Pathology](https://plantpath.wisc.edu/) at the [University of Wisconsin-Madison](http://www.wisc.edu). Originally from Mexico City, she did her Undergraduate degrees
in Actuarial Sciences and Applied Mathematics at [ITAM](https://www.itam.mx/en).
Then, she did a MA in [Mathematics](http://www.math.wisc.edu) and a PhD in [Statistics](http://www.stat.wisc.edu) at the [University of Wisconsin-Madison](http://www.wisc.edu). 

<div class="container">
    <div class="row">
        <div class="column">
            <a href="../pics/claudiaSmall1.png">
            <img src="https://crsl4.github.io/forensic-stat//pics/claudiaSmall1.png" width="150"
                  title="Claudia Sol&iacute;s-Lemus" alt="Claudia Sol&iacute;s.Lemus"/></a>
        </div>
        <div class="column">
            Pronouns: she/her <br/>
            <a href="https://namedrop.io/claudiasolislemus">Name pronunciation</a><br/>
            <a href="https://solislemuslab.github.io/">Lab website</a><br/>
            <a href="https://scholar.google.com/citations?user=GrUypj8AAAAJ&hl=en&oi=ao">Google scholar</a><br/>
            <a href="https://github.com/crsl4">GitHub</a><br/>
            <a href="https://solislemuslab.github.io//pages/people.html">Contact Info</a><br/>
        </div>
    </div>
</div>

