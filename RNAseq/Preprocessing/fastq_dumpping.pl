#!/usr/bin/perl
use warnings;
use strict;

#Write SRR directory
print("Write SRR file dir:\n");
my $srr_dir = <STDIN>;
chomp($srr_dir);

#find srr files
my @srr_list = ();
push(@srr_list, `find $srr_dir -name "SRR*" -print`);
# foreach (@srr_list){
# 	push(@srr_list, chomp($_));
# }

@srr_list = sort(@srr_list);

#output directory
#Write output pathway you want
print("Write output pathway you want:\n");
my $out_dir = <STDIN>;
chomp($out_dir);


#dummping with 
foreach (@srr_list){
    my @Oname = split(/\n/, $_);
    my @Oname_1 = split(/\//, $Oname[-1]);
    print("Making counting file named $Oname_1[-1]....\n");
    print("$_\n");
    print("printing command:\n/media/bm/790240e4-2887-451f-ad02-1b19c4b4e120/Tools/sratoolkit.2.10.8-ubuntu64/bin/fasterq-dump -e 8 --split-3 -O $out_dir $Oname[-1]\n\n");
    `/media/bm/790240e4-2887-451f-ad02-1b19c4b4e120/Tools/sratoolkit.2.10.8-ubuntu64/bin/fasterq-dump -e 8 --split-3 -O $out_dir $Oname[-1]`;
}