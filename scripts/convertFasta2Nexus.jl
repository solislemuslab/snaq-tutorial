## julia script to convert Phylip file to Fasta/Nexus file
## Original name: convertPHYLIP2FastaNexus.jl
## Claudia May 2017
## modified to convert fasta to nexus
## Claudia Oct 2023

## You need to have a "nexus-alignments" folder created,
## and the data needs to be in a "fasta-alignments" folder

## Folder structure:
## - data
##      - fasta-alignments
##      - nexus-alignments
## - scripts (this script inside)

files = readdir("../data/fasta-alignments/")

## Check if there is a .DS_Store file
if(files[1] == ".DS_Store") ##will fail if there are other files that start with .
    deleteat!(files,1)
end

verbose = false ## only if we want to see the lines as are written

for(file in files)
    @show file
    f = open(string("../data/fasta-alignments/",file))
    p = split(file,".")
    nexus = string("../data/nexus-alignments/",p[1],".nex")

    taxtotal = 0
    taxa = String[]
    seq = String[]
    readNumTaxa = 0
    readSeqLength = 0

    for line in eachline(f)
        verbose && @show line
        
        if(contains(line,">"))
            name = split(line,">")[2]
            push!(taxa,name)
            taxtotal += 1
        else
            push!(seq,line)
        end
    close(f)

    length(seq) == taxtotal || error("Something wrong when reading the fasta file. I found $(length(seq)) sequences, and there should be $taxtotal")

    ## writing NEXUS file
    g = open(nexus,"w")
    write(g,"#NEXUS\n\nbegin taxa;\ndimensions ntax=$taxtotal;\ntaxlabels\n")
    for i in 1:taxtotal
        write(g,"$(taxa[i])\n")
    end
    write(g,";\nend;\n\nbegin characters;\ndimensions nchar=$readSeqLength;\nformat datatype=dna gap=- missing=?;\nmatrix\n")
    for i in 1:taxtotal
        write(g,"$(taxa[i])\t\t")
        write(g,"$(seq[i])\n")
    end
    write(g,";\nend;")
    close(g)
end
