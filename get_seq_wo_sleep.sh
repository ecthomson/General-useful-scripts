exec < $1
while read id
do
wget -O $id http://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?tool=portal\&sendto=on\&log$=seqview\&db=nuccore\&dopt=fasta\&sort=\&val=$id\&from=begin\&to=end\&maxplex=1
done
