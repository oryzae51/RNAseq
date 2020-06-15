#/usr/bin/perl
use strict;
use warnings;

#Write fastq file dir and index dir
my $directory = shift; #raw fastq file directory
my $idx_dir = shift; #Index file directory
my $specific_name = "*fastq.gz"; #specific_name for fastq file
my $hit_dir = shift;

#Extract each fastq file drictory from $fastq_dir and save to @file_list
#my $file = `find $directory -name "*.fastq"`;
#my @file_list = split(/\n/, $file);
#Declare fastq file directory list
my @file_list = ();
push(@file_list, `find $directory -name '$specific_name'`);
@file_list = sort(@file_list); #sort in suffix

#check if the @file_list is made correctly
@file_list = sort(@file_list);
for (@file_list){
    print("$_");
}

# my $i = 0;
# for (@file_list){
#     my @Oname = split(/\//, $file_list[$i]);
#     @Oname = split(/\.f/, $Oname[-1]);
#     print("Making aligning file named $Oname[0]....\n");
#     `hisat2 -x $idx_dir -1 $file_list[$i] -2 $file_list[$i+2] -S ~/sequence_data/hisat2_aligned/$Oname[0]`;
#     if ($i%2==0){
#         $i+=1;
#     }
#     elsif ($i%2!=0){
#         $i+=3;
#     }
#     if ($i >=16){last;}
# }

for (my $i=0; $i<$#file_list; $i+=2){
    my @Oname_1 = split(/\//, $file_list[$i]);
    my @Oname_2 = split(/_/, $Oname_1[-1]);
    print("Making alignment file named $Oname_2[0]....\n");
    `hisat2 -x $idx_dir -1 $file_list[$i] -2 $file_list[$i+1] -S $hit_dir`;
}