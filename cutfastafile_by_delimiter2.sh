#This bash script will rename all the fasta file names to contain everything before the underscore _
#Emma Thomson April 2019
#Change the name of the fasta file to make it work

"Welcome to fasta delimiter
WARNING - THIS WILL IRREVERSIBLY CHANGE THE CONTENTS OF YOUR FASTA FILE - A COPY HAS BEEN SAVED FOR YOU AS .copy - JUST IN CASE..."
echo -n "
Enter the name of the delimiter in your fasta file. Usually this might be a hyphen - or an underscore _. I'm afriad it can only be one character
$ "
read delimiter
echo -n "Enter the name of the file you want to change
$ "
read fastafile
cp $fastafile $fastafile\.copy
sed -i 's/ /_/g' $fastafile
grep ">" $fastafile | sed 's/ /_/g' | sed 's/\t/_/g'> fa1
less fa1 | cut -f 1 -d $delimiter> fa2
paste fa1 fa2 | while read n k; do sed -i "s/$n/$k/g" $fastafile; done
clear
echo "Your sequence names have been replaced as follows:
"
paste fa1 fa2
#rm -rf fa1 fa2
