#!/usr/bin/perl
use warnings;
use strict;

print("sgRNA candidate list file directory: \n");
my $candi_list = <STDIN>; #Directory of candidate list
chomp($candi_list);
my @candi_name = split(/\./, $candi_list); #Directory of output
my $sgRNA_ext = "$candi_name[0]"."_ext.txt";
open(F, "$candi_list") or die "Cannot open file";
open(O, ">$sgRNA_ext");
my $i = 0;
my @seq_l = 0;
my @seq = 0;
my $seq = 0;
while(<F>){
    #print($i);
    @seq_l = split(/\t/, $_);
    $seq = $seq_l[0];
    #print($seq);
    if ($i > 0){
        #$seq =~ tr/([ATCG]GG)$//d;
        chop($seq);chop($seq);chop($seq);
        print("$seq\n");
        print O ">$i\n";
        print O "$seq\n";
    }
    $i++;
}

close(O);
close(F);


