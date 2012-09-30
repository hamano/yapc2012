#!/usr/bin/env perl
# use 5.014;
use integer;
use List::Util;

my @odd_primes = (3);
PRIME_TEST_LOOP:
for (my ($i, $j) = (5, -1); @odd_primes != 9999; $i += (++$j % 2 ? 4 : 2)) {
  for my $p (@odd_primes) {
    last if $i < $p * $p;
    next PRIME_TEST_LOOP if $i % $p == 0;
  }
  push @odd_primes, $i;
}

print List::Util::sum(2, @odd_primes), "\n";
