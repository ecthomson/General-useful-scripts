#Script for sorting out the mapped from the unmapped in a fasta file
#Emma and Rajiv December 2019

#Firstly the sequence data must be on one line and there must be no empty lines


#Second separate the names from the sequences
#Enter the file name
echo -n "What is your file name?"
read name
grep ">" $name >name1
grep -v ">" $name >name2
paste name1 name2 > file_tab
cat file_tab | grep -v "not_mapped" | sed 's/\t/\n/g'> $name\_mapped_file.fa
rm -rf name name1 name2 file_tab
