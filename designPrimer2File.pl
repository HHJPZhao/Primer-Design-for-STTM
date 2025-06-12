#! usr/bin/perl -w
my $inseq= shift @ARGV;
my $rawPout= "rawPout.txt";
my $rawPout2="rawPout2.txt";
my $Pout = "Pout.txt";
# open ROUT, ">$rawPout";
# open OUT, ">$Pout";
# use Bio::SeqIO;
# use Bio::PrimerDesigner;
# use Bio::Tool::Primer3;
# use Bio::Tool::Run::Primer3;
# design some primers.
# the output will be put into temp.out
  use Bio::Tools::Run::Primer3;
  use Bio::SeqIO;
  use Bio::Seq;
  use Bio::Tools::Primer3;
  my $seqio = Bio::SeqIO->new(-file=> "<$inseq");
#  my $seq = $seqio->next_seq;
#  my $primer3 = Bio::Tools::Run::Primer3->new(-seq => $seq,
#                                              -outfile => ">$Pout",
#                                              -path => "/usr/bin/primer3_core",
#                                              );
  while ($seq = $seqio->next_seq()){   
     # print the sequence   
     # print $seq -> seq,"\n";
     my $primer3 = Bio::Tools::Run::Primer3->new( -seq => $seq,
                                                 -outfile => "$rawPout",
                                                -path => "/usr/bin/primer3_core"
                                                  );
     my $dna = $seq -> seq;
     $primer3->add_targets (  PRIMER_NUM_RETURN   => 1,
                        # 'PRIMER_MIN_TM'=>56,
                        # 'PRIMER_MAX_TM'=>90,
                              PRIMER_PRODUCT_SIZE_RANGE => '100-500',
                        );
#     $hashref = $primer3->arguments(SEQUENCE);
 #    print $hashref;
     $results = $primer3->run;
     print "There were ", $results->number_of_results, " primers\n"; 
     open ROUT, "$rawPout" or die $!;    
     open ROUT2, ">>$rawPout2" or die $!;   
     while (<ROUT>){
    # print $_;
    if (m/_ID/){
    printf ROUT2 $_;
    print "there is \n";
    } else {if (m/(LEFT|RIGHT)_\d+_SEQUENCE/){
    printf ROUT2 $_;
       }
    }
    }
    
     close ROUT;
     close ROUT2;

   #     my $p3 = Bio::Tools::Primer3->new(-file=>"<$rawPout2");
     
   #  my $num = $p3->number_of_results;
   #  print "There were $num results\n";
 
   #  my $all_results = $p3->all_results;
   #  print "ALL the results\n";
   #  foreach my $key (keys %{$all_results}) {
   #  print "$key\t${$all_results}{$key}\n";
   # }
     
   #  while (<ROUT>){
   # s/SEQUENCE_TEMPLATE/SEQUENCE/;
   # } 

   #  my $primer = $p3->next_primer();
   #  print "The left primer in the stream is ". $primer->get_primer('-left_primer')->seq->seq, "\n";


     }

 # close ROUT;
 # close OUT;
 # my $p3 = Bio::Tools::Primer3->new(-file=>"<$rawPout");
 
 # parse primer3 output to get some data
 # this is also called from Bio::Tools::Run::Primer3
 # use Bio::Tools::Primer3;
 
 # open ROUT,"<$rawPout";
 
 # read a primer3 output file
 # my $p3 = Bio::Tools::Primer3->new(-file=>"data/primer3_output.txt");
 # my $p3 = Bio::Tools::Primer3->new(-file=>"<$rawPout");
 
 # how many results were there?
 # my $num = $p3->number_of_results;
 # print "There were $num results\n";

 # get all the results
 # my $all_results = $p3->all_results;
 # print "ALL the results\n";
 # foreach my $key (keys %{$all_results}) {
 #   print "$key\t${$all_results}{$key}\n";
 # }
 
 # open ROUT,"<$rawPout";
 

 ## get specific results
 # my $result1 = $p3->primer_results(1);
 # print "The first primer is\n";
 # foreach my $key (keys %{$result1}) {
 #   print "$key\t${$result1}{$key}\n";
 # }

 # get the results as a Bio::Seq::PrimedSeq stream
 # open ROUT,"<$rawPout";
 
 # my $primer = $p3->next_primer;
 # print "The left primer in the stream is ",
 #  $primer->get_primer('-left_primer')->seq->seq, "\n"; 

# or after the fact you can change the program_name
#  $primer3->program_name('my_suprefast_primer3');
#
# unless ($primer3->executable) {
#    print STDERR "primer3 can not be found. Is it installed?\n";
#    exit(-1)
#  }
#
  # what are the arguments, and what do they mean?
 #  my $args = $primer3->arguments;

 # print "ARGUMENT\tMEANING\n";
 # foreach my $key (keys %{$args}) {print "$key\t", $$args{$key}, "\n"}

    


  # set the maximum and minimum Tm of the primer
  # $primer3->add_targets(  PRIMER_NUM_RETURN   => 1,
                        # 'PRIMER_MIN_TM'=>56,
                        # 'PRIMER_MAX_TM'=>90
                        #   PRIMER_PRODUCT_SIZE_RANGE => '100-250',
                        #);
  
  # $primer3->arguments;
  # design the primers. This runs primer3 and returns a 
  # Bio::Tools::Run::Primer3 object with the results
  # $results = $primer3->run;

  # see the Bio::Tools::Run::Primer3 pod for
  # things that you can get from this. For example:

  # print "There were ", $results->number_of_results, " primers\n";
# my $seqs = Bio::SeqIO->new(-file => "<$inseq");
# open OUT, '>> raw_output.txt';
# my $pd = Bio::PrimerDesigner->new;
# while ( my $seq = $seqs->next_seq() ) {
#     my $seqid = $seq->id;
#     print "$seqid \n";
#     my $dna = $seq->seq;
#     print "$dna \n";
#     my %params = (
#         PRIMER_NUM_RETURN   => 1,
#         PRIMER_SEQUENCE_ID  => $seqid,
#         SEQUENCE            => $dna,
#         PRIMER_PRODUCT_SIZE_RANGE => '100-250', );
#     my $primers = $pd->design( %params ) or die $pd->error;
#     my ($left_primer,$right_primer);
#     if ( !$primers->left ) {
#        warn "No primers found for $seqid\n";
#        }
#        else{
#           $left_primer  = $primers->left;
#           $right_primer = $primers->right;
#        }
#      print join(',', $seqid, $left_primer, $right_primer);
#      print "\n";
#     print OUT $primers->raw_output; #此处的perl文档也是错误的，应更正为此
#   }
