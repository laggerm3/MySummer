#!/usr/bin/perl
use strict;
use warnings;
#column switching if column 2 is greater than column 3
#adding a plus sign if that is a case so another column with a positive sign
my @output;
open (BED_FILE, $ARVG[0]) or die "Cannot open the file: $!";
while (my $line = <BED_FILE>) {
	push <BED_FILE>, $_;
	my @column = split(" ",$line );
	if ( $column[1] => $column[2] ) {
        push( @output, "$column[0]\t$column[2]\t$column[1]\t$column[3]\t+" );
    }
	else {
	push @output, "$column[0]\t$column[1]\t$column[2]\t$column[3]";
    }
}

print "$_\n" for @output
