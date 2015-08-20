#!/usr/bin/perl
use strict;
use warnings;
#column switching if column 2 is greater than column 3
#adding a plus sign if that is a case so another column with a positive sign
my @input;
my @output;
open(DATA, $ARGV[0]) or die "Cannot open the file: $!";

while (<DATA>) {
    push @input, $_;
}
for (@input) {
    my @column = split( /\s+/, $_ );

    if ( $column[1] <= $column[2] ) {
        push( @output, "$column[0] $column[1] $column[2] $column[3]" );
    }
    else {
        push ( @output, "$column[0] $column[2] $column[1] $column[3]");
    }
}

print "$_\n" for @output

