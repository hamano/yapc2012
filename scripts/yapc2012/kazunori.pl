#!/usr/bin/perl

use strict;
use warnings;

my @p = (2 .. 104729);

my $i = 0;
while($p[$i]*$p[$i] < $p[scalar(@p)-1]){
        @p = grep{$_ % $p[$i] != 0 || $_ == $p[$i]} @p;
        $i++
}

my $sum = 0;
$sum += $_ for (@p);

print $sum . "\n";

