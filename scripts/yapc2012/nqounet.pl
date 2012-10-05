#!/usr/bin/env perl
use List::Util ();

my @seeds = (2);
my @primes = (3, 5, 7, 11);
my $n = 11;
PRIME:while ($n += 2) {
  my $sqrt_num = sqrt($n);
  for (@primes) {
    next PRIME unless $n % $_;
    last if $_ > $sqrt_num;
  }
  push @primes, $n;
  last if @primes > 9998;
}

print List::Util::sum(@seeds, @primes);

