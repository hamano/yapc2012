#!/usr/bin/perl
use strict;
use integer;
my @primes = ();
my $max;
my $count = 1;
my $total = 2;
my $i = 1;
my $j;
#奇数のみを対象にする
MAIN:
while (1) {
  $i += 2;
  $max = sqrt($i);
  for $j (@primes) {
    next MAIN if ($i % $j == 0);
    last if ($j > $max);
  }
  push @primes,$i;
  $total += $i;
  last if (++$count == 10000);
}
print $total . "\n";

