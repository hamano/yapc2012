#!/usr/bin/perl

use strict;
use warnings;

my @p = (2 .. 104729);

my $i = 0;
while($i < int(sqrt(scalar(@p)))){
        @p = grep{$_ % $p[$i] != 0 || $_ == $p[$i]} @p;
        $i++
}

my $sum = 0;
$sum += $_ for (@p);

print "Answer:" . $sum . "\n";


