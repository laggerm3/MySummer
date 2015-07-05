#!/usr/bin/perl
use strict;
use warnings;
#parsing out repmod and blast to get the corresponding sequence to names that fall within certain evalue threshold

#open repmod_results
my %sequence_of;

open(INPUT_REPMOD, $ARGV[0]) or die "Cannot open the file: $!";
my $hash_key1;
my $hash_value;
while (my $line = <INPUT_REPMOD>) {
	if ($line =~ /^>(\S+)/) {
		$hash_key1 = $1;
	}
	elsif ($line =~ /\S/) {
		chomp $line;
		$hash_value = $line;
		$sequence_of{$hash_key1} = $hash_value;
	} 
}
# prints out the name and corresponding sequence from repeat modeler
foreach $hash_key1 (keys %sequence_of) {
	print "$hash_key1\t$sequence_of{$hash_key1}\n";
}

#open the evalues that need to be compared to the repmod_results, based on the evalue
my %name_of;

open(INPUT_EVALUES, $ARGV[1]) or die "Cannot open the file: $!";
my $hash_key2;
my $hash_value2;
while (my $line2 = <INPUT_EVALUES>) {
	if ($line2 =~ /(\S+)/) {
		$hash_key2 = $1;
		$hash_value2 = $line2;
		$name_of{$hash_key2} = $hash_value2;
	}
	elsif ($line2 =~ /\S/) {
		chomp $line2;
	}
} 
#prints out the names from the selectevalues.fa after being organized into hashes
#prints out the corresponding sequences to the evalue met family names
foreach my $hash_key3 (keys %name_of) {
	if ($hash_key1 = $hash_key3) {	
		print "Corresponding sequences: $hash_key3\t$sequence_of{$hash_key1}\n";}
}

close INPUT_REPMOD;
close INPUT_EVALUES;
exit;
