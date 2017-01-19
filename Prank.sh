#! /bin/bash

for file in *.fasta; do (./prank -d=$file -o=$file -t=tree_file -F && /
cp *.best.fas /work/dechavezv/Pipeline/Beds/testing_GATK/For_llan/Alignments_for_IIan);done
