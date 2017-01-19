#! /bin/bash

#You must provide a file name database.fasta with all the molecular markers of diferent species

echo '#########'
echo 'Split_by_ID_of_molecular_marker'
echo '#########'
awk -F "\t" '/^>/ {F = $5".fasta"} {print > F}' database.fasta

rm database.fasta # remove this file so it doesnt be consider in the next step

echo '#########'
echo 'Create_subfolders_with_one-hundred_files_each_one'
echo '#########'
i=0; for f in *.fasta; do d=dir_$(printf %03d $((i/300+1))); mkdir -p $d; mv "$f" $d; let i++; done

echo '#########'
echo 'Alingment_with_Prank'
echo '#########'
for dir in dir*; do (cp Prank.sh $dir && cp tree.txt && cd $dir && / 
ln -s /work/dechavezv/Pipeline/Beds/testing_GATK/For_llan/PRANK/PRANK/prank-msa/src/prank && cd ..);done

#echo '############'
#echo Aling_muscle
#echo '############'
#for dir in dir*; do (cp muscle3.8.31_i86linux64 $dir && cd $dir && for file in *.fasta;do (./muscle3.8.31_i86linux64 -in $file -out musscle_$file -maxiters 1 -diags
#1 -sv -distance1 kbit20_3);done 














