# Script to get desired sequenses taking ids from a list file
# Prior to running this script, create a list file with all the IDs
# Usage: GetUnassigned scaffolds.fasta list

awk '{if($1~/>/) printf("\n%s\t",$0); else printf("%s",$0);}' $1 > /tmp/temp_$$
grep -f $2 /tmp/temp_$$|awk '{print $1"\n"$2}'|fold -w 70
rm /tmp/temp_$$
