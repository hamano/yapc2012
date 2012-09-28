#!/usr/bin/env perl
use strict;
use warnings;

my $N = 104729; # 10000th prime numer.
my @numarray = (2..$N);
my @primarray;

my $ap = 0;
my $num_max = $N;
while ($ap <= $num_max-2) {
    my $prim;
    for (; $ap <= $num_max-2; $ap++) {
        if (defined $numarray[$ap]) {
            $prim = $numarray[$ap];
            last;
        }
    }
    if ($ap > $num_max-2) { last }
    push @primarray, $prim;

    my $multi = $prim;
    while ($multi <= $num_max) {
        delete $numarray[$multi-2];
        $multi += $prim;
    }

    for (my $i = @numarray; $i >= 0; $i--) {
        if (defined $numarray[$i]) {
            $num_max = $numarray[$i];
            last;
        }
    }
    if ($num_max < sqrt($prim)) { last }
}

my $sum = 0;
$sum += $_ for @primarray, grep defined($_), @numarray;

print "$sum\n"; # Sum of prim numbers between 2 and 10000

