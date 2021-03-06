#!/usr/bin/perl
use warnings;
use strict;

print("fastq raw data dir\n");
my $fastq_dir = <STDIN>; #RAW fastq file directory
chomp($fastq_dir);
print("output dir\n");
my $output_dir = <STDIN>; #output file directory for FastQC
chomp($output_dir);
print("specific name for fastq\n");
my $specific_name = <STDIN>; #specific_name for fastq file
chomp($specific_name);
#Extract each fastq file drictory from $fastq_dir and save to @file_list

#Declare fastq file directory list
my @file_list = ();
push(@file_list, `find $fastq_dir -name '$specific_name'`);
@file_list = sort(@file_list); #sort in suffix

#Iterate each file in @file_list and run fastq

my $i = 0;
foreach (@file_list) {
	print("Quality checking of fastq file \n");
	print("/media/bm/790240e4-2887-451f-ad02-1b19c4b4e120/Tools/FastQC/fastqc -o $output_dir --noextract $_");
	`/media/bm/790240e4-2887-451f-ad02-1b19c4b4e120/Tools/FastQC/fastqc -o '$output_dir' --noextract $_`;
}