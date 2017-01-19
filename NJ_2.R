#load packages
library(ape)
library(ade4)
library(seqinr)
library(phangorn)
library(Biostrings)

#you must provide an alignmetn in phylip format
#you can use the script in the path /datta3/dechavezv/scrots/perl/fasta2phylip.pl
#to convert from fasta to phylip (this is way fster than using R!!!!!)

file <- read.phyDat("edited_names_final_.phy", format = "phylip") #read file in phylip format
dm  <- dist.ml(file) #calcualte distances matrix
tree <- NJ(dm) #construct the tree from the matrix
tree_root <- root(tree, 'Gray_Fox', resolve.root=TRUE)
write.tree(tree_root, file ="tree_root_11_species.txt") #write the tree and give it a name
