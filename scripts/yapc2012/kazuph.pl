#!/usr/bin/env perl
use strict;
use warnings;
use List::Util qw/sum/;
my @primes;
sub is_prime{
    my $n = shift;
    for my $d (@primes){
        last if $d*$d > $n;
        return unless $n % $d;
    }
    push @primes,  $n;
    return $n;
}
my $max = 10000;
my $num = 1;
while (@primes < $max){
    $num++;
    is_prime($num)
}
# is_prime($_) for (2 .. $max);
# print join(" ",  @primes),  "\n";
print sum(@primes),  "\n";

