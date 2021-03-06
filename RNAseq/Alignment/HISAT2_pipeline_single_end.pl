#usr/bin/perl
use strict;
use warnings;

#Write fastq file dir and index dir
my $directory = <STDIN>;
chomp($directory); #raw fastq file directory
my $hisat2_indx = <STDIN>;
chomp($hisat2_indx); #Index file directory and basename
my $specific_name = <STDIN>; #specific_name for fastq file
chomp($specific_name);
my $hit_file = <STDIN>;
chomp($hit_file); #file directory for SAM output

#Extract each fastq file drictory from $fastq_dir and save to @file_list
#my $file = `find $directory -name "*.fastq"`;
#my @file_list = split(/\n/, $file);
#Declare fastq file directory list
my @file_list = ();
push(@file_list, `find $directory -name '$specific_name'`);
@file_list = sort(@file_list); #sort in suffix
#shift(@file_list);
#check if the @file_list is made correctly
for (@file_list){
    chomp($_);
}
for (@file_list){
    print($_);
}

for (my $i=0; $i<$#file_list+1; $i++){
    my @Oname_1 = split(/\//, $file_list[$i]);
    my @Oname_2 = split(/\./, $Oname_1[-1]);
    print("Making alignment file named $Oname_2[0]....\n");
    print("$file_list[$i]\n");
    print("/media/bm/790240e4-2887-451f-ad02-1b19c4b4e120/Tools/hisat2-2.0.4/hisat2 -x $hisat2_indx -p 8 -U $file_list[$i] -S $hit_file/$Oname_2[0]\n");
    `/media/bm/790240e4-2887-451f-ad02-1b19c4b4e120/Tools/hisat2-2.0.4/hisat2 -x $hisat2_indx -p 8 -U $file_list[$i] -S $hit_file/$Oname_2[0]`;
}
