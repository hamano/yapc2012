#!/usr/bin/env perl
use strict;
use warnings;
use List::Util qw(sum);

my $MAX_NUM = 104729;
my @table = (0..$MAX_NUM);
my @primes = ();

sub is_prime {
    my $num = shift;
    return unless $table[$num];
    push @primes, $num;

    # 素数の倍数はもういらないので判定ついでに落とす
    my $multi = $num + $num;
    while ( $multi <= $MAX_NUM ) {
        delete $table[$multi];
        $multi += $num;
    }
}

my $n = 1;
while ( @primes < 10000 ) {
    is_prime(++$n);
}
print sum(@primes);
