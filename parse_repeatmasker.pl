#!/usr/bin/perl
use strict;
use Data::Dumper;
#script designed to parse out repeatmasker results-> $ARGV[1]
#with $ARGV[0] by throwing it into a hash
#currently set to count what would be the key value and print count --> double check with FILE1
#counts the names of the elements that are on the list in FILE1

my %names;

open(NAMES_CORRESPONDING, $ARGV[0]) or die "Cannot open the file: $!";
while (my $line = <NAMES_CORRESPONDING>)  {
	my @cors_name = split(" ", $line);
	$names{$cors_name[0]}++;
}
close NAMES_CORRESPONDING;

#printing out the names from the file to make sure they are all stored into the hash
#prints name and amount of times in the file
#print Dumper( \%names );

my %count;
my %amount;
open(REPEATMASKER_RESULTS, $ARGV[1]) or die "Cannot open the file: $!";
while (my $line = <REPEATMASKER_RESULTS>)  {
	my @repeatmasker = split(" ", $line);
	my $element = $repeatmasker[9];
	tr/()//d for $repeatmasker[11];
	
#if the names from the table is in the %names hash then it will print the row from the table it is in
	if ( $names{ $element } ) {
####this command below can be used to parse out specific rows needed, multi-use if you want to analyze a specifc row
#	print join("  ", @repeatmasker[4,11,12,9]), "\n";	
#counting the names that appear in the new table and setting to the hash named count	
	$count{$repeatmasker[9]}++;
	$amount{$element}+=($repeatmasker[12] - $repeatmasker[11]);
	}

}
#printing the count of the names found on the table that match the elements list given
print Dumper (\%count);
print Dumper (\%amount);
close REPEATMASKER_RESULTS;
exit;
