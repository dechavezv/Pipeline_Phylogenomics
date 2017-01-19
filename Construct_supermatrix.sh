#! /bin/bash
#This script will construct the supermatrix and edit it in order to be use in the NJ_2.R script
#Before using this script be sure that all your Prank alignment of infivudual genes (<file>.best.fas) are Sort in alfabetical order
#Also be sure that first few lwtters in sed command correspond to those in the header of the fasta files

echo '########'
echo 'Concatanate Prank.fas vertically with no space'
echo '########'

for f in Sort*; do paste -d ''  final.res | paste -d '' - $f >temp; cp temp final.res; done; rm temp

echo '########'
echo 'Edit header of supermatrix'
echo '########'

sed -e 's/>Jackal.*/>Jackal/g;s/>Golden.*/>GoldenW/g;s/>Dog.*/>Dog/g;s/>Gray_wolf.*/>GrayW/g;s/>Coyote.*/>Coyote/g;s/>Hunting_dog_Kruger/>Kruger/g;s/>Dhole.*/>Dhole/g;s/>Gray_Fox/>GrayF/g;s/Hunting_dog_Kenyan.*/Kenya/g;s/Andean_fox_.*/AndeanF/g;s/Ethiopian_wolf.*/Ethiopian/g' final.res > Supermatrix_11_canids_geneFlank10k.fas

echo '########'
echo 'Fasta_to_phylip'
echo '########'
perl fasta2phylip.pl Supermatrix_11_canids_geneFlank10k.fas > Supermatrix_11_canids_geneFlank10k.fas.phy
