Primer Design for the STTM Technology 
Perl/BioPerl Scripts for Short Tandem Target Mimic for microRNA


bioperl 
Installing BioPerl on Windows  http://www.bioperl.org/wiki/Installing_BioPerl_on_Windows
GUI Installation (activPerl)

PipeLine
MicroRNA List in CSV File, Use CSV_to_Fasta, Generate MicroRNA Fasta List
MicroRNA Fasta File in RNA Alphabeta, Use RNA_to_DNA, Generate DNA Sequence for STTM Primer Design
MicroRNA Fasta File in DNA Alphabeta, Use oligo_STTM, Generate Primers for MicroRNA 



cd c:\users\desktop
cd design microRNA1
perl csv_to_Fasta microRNA.csv microRNA.fa
perl RNA_to_DNA microRNA.fa microDNA.fa
perl oligo_STTM microDNA.fa primer.csv
perl oligo_STTM microDNA.fa Fasta STTM.fa Fasta primer.csv 132

