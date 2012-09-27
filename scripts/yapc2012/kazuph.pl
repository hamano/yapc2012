#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use List::Util qw(sum);
my @primes = (2, 3, 5);
sub is_prime {
    my $num = shift;
    for my $n (@primes) {
        last if $n*$n> $num;
        return 0 if $num % $n == 0
    }
    return 1;
}

my $n = 0;
my $prime;
while (@primes < 10000) {
    $n += 1;
    $prime = 6 * $n + 1;
    push @primes, $prime if is_prime($prime);
    $prime += 4;
    push @primes, $prime if is_prime($prime);
}
# print "@primes";
print sum(@primes);
