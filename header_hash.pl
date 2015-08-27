#!/usr/bin/perl
use strict;
use warnings;
#### script will match keys (sequences)
#### if keys match the values (headers) will be printed together in a string
my %sequence;

open(TE_NAMES_FILE, $ARGV[0]) or die "Cannot open the file: $!";
my $hash_key_TE;
my $hash_value;
while (my $line = <TE_NAMES_FILE>) {
	if ($line =~ /^>(\S+)/) {
		$hash_key_TE = $1;
	}
	elsif ($line =~ /\S/) {
		chomp $line;
		$hash_value = $line;
		$sequence{$hash_key_TE} = $hash_value;
	} 
}

#foreach $hash_key_TE (keys %sequence) {
#	print "$sequence{$hash_key_TE}\t$hash_key_TE\n";
#	}

my %sequence_2;
open (COORDINATES_FILE, $ARGV[1]) or die "Cannot open the file: $!";
my $hash_key_coord;
my $hash_value_coord;
while (my $line2 = <COORDINATES_FILE>) {
	if ($line2 =~ /^>(\S+)/) {
		$hash_key_coord = $1;
	}
	elsif ($line2 =~ /\S/) {
		chomp $line2;
		$hash_value_coord = $line2;
		$sequence_2{$hash_key_coord} = $hash_value_coord;
	} 
}

#foreach $hash_key_coord (keys %sequence_2) {
#	print "$sequence_2{$hash_key_coord}\t$hash_key_coord\n";
#	}
foreach my $hash_key_coord (keys %sequence_2) {
	if ($sequence{$hash_key_TE} = $sequence_2{$hash_key_coord}) 		{
	print ">$hash_key_TE|$hash_key_coord\n$sequence_2{$hash_key_coord}\n";}
}
