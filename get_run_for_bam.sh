#Script to associate sam files with the fastq run folder (run number sits in the name of the ls -l fastq list)

#Emma Thomson 17/03/21

rm -rf fastq fq sam1 sam fq_fq_run fq_run_list
ls -l *.fastq > fastq
rev fastq | cut -f 1 -d "/" | rev | sed 's/\.fastq//' > fq
cat fastq | cut -f 2 -d ">" | sed 's/\/home1\/Acute_HCV_temp\///g'| sed 's/ //g'| cut -f 1 -d "_" > fqrun
paste fq fqrun > fq_fq_run
cat fq_fq_run | sed 's/\t/_/g' > fq_run_list
paste fq fq_run_list > rename_list
while read a b; do rename "s/"$a"/"$b"/g" *.bam; done < rename_list

