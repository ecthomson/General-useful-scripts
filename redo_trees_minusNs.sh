#This script will run a mafft alignment and tree after removing Ns
#September 2019 ET

#Remove the Ns and the ns
sed 's/n//g' Consensus_60_human.fasta | sed 's/N//g' > Consensus_60_human.fasta_clean

#Remove the text breaks using awk
for one in *_clean; do cat $one | awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}'>$one\.oneline; done

#Align
mafft Consensus_60_human_clean.oneline > Consensus_60_human_aligned.fasta
#Tree
fasttree -nt Consensus_60_human_aligned.fasta > human_clean.tree
clear
echo "Analysis complete. Output is *.sam, samstats, allconfile (all consensus sequences) and Consensus_60.fasta (all consensus sequences with coverage of >60% and a tree called human.tree)"
