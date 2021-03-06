#/usr/bin/perl
use strict;
use warnings;

#Write annotation gtf file dir
print("Write annotation gtf file dir:\n");
my $gtf_dir = <STDIN>;
chomp($gtf_dir);

#Write input align_data dir
print("Write input align_data dir\n"); 
my $align_data_dir = <STDIN>;
chomp($align_data_dir);

#Write alginment data specific name
print("Write alginment data specific name\n"); 
my $align_spec_name = <STDIN>;
chomp($align_spec_name);

print("Write a strandedness\n> 0 = unstrandedness\n> 1 = strandedness\n> 2 = reversestrandedness");
my $strandedness = <STDIN>;
chomp($strandedness);

#Write output pathway you want
print("Write output pathway you want:\n");
my $out_dir = <STDIN>;
chomp($out_dir);

# #Write input BAM/SAM dir
# print("Write input BAM/SAM dir\n");
# my $sam_dir = <STDIN>;
# chomp($sam_dir);

#add sam folder dir to list
my @sam_list = ();
push(@sam_list, `find $align_data_dir -name "$align_spec_name" -print`);
@sam_list = sort(@sam_list);
for (@sam_list){
    chomp($_);
}
for (@sam_list){
    print("$_\n");
}

#iterate featureCounts
foreach (@sam_list){
    my @Oname_1 = split(/\//, $_);
    print("Making counting file named $Oname_1[-1]....\n");
    print("$_\n");
    print("printing command:\n/media/bm/790240e4-2887-451f-ad02-1b19c4b4e120/Tools/subread-2.0.1-Linux-x86_64/bin/featureCounts -Q 10 -T 8 -s $strandedness -a $gtf_dir -o $out_dir/$Oname_1[-1].txt $_\n\n");
    `/media/bm/790240e4-2887-451f-ad02-1b19c4b4e120/Tools/subread-2.0.1-Linux-x86_64/bin/featureCounts -Q 10 -T 8 -p -s $strandedness -a $gtf_dir -o $out_dir/$Oname_1[-1].txt $_`;
}
