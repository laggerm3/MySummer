#!/usr/bin/perl
use strict;
use warnings;
#parsing out repmod and blast to get the corresponding sequence to names that fall within certain evalue threshold

#open repmod_results
my %sequence_of;

open(INPUT_REPMOD, $ARGV[0]) or die "Cannot open the file: $!";
my $hash_key;
my $hash_value;
while (my $line = <INPUT_REPMOD>) {
	if ($line =~ /^>(\S+)/) {
		$hash_key = $1;
	}
	elsif ($line =~ /\S/) {
		chomp $line;
		$hash_value = $line;
		$sequence_of{$hash_key} = $hash_value;
	} 
}
# prints out the name and corresponding sequence from repeat modeler
foreach my $hash_key1 (keys %sequence_of) {
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
foreach my $hash_key3 (keys %name_of) {		
		print "$hash_key3\n";
	}

#establishing the comparison with the repmod_results and selectevalues.fa

my @common_familynames = ();
foreach (keys %name_of) {
	push(@common_familynames, $_) if exists $sequence_of{$_};
###GLR: the second half of the print statement
###GLR: calling up the sequence is giving me issues; %sequence_of{$hash_key1}
###GLR: that is the value that is given to each key of the rep_mod file, corresponding sequence
	print "$_\t%sequence_of{$hash_key1}\n";
}
close INPUT_REPMOD;
close INPUT_EVALUES;
exit;
