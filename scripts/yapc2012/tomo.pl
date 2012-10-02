use strict;
use warnings;
use List::Util qw/sum/;

my @primes = (2,3,5);
my ($add,$add2) = (4,2);
our ($i,$j) = (7,0);
my $root = 0;

while ( @primes < 10000 ) {
    $root = int(sqrt $i);
    push @primes, $i if is_prime();
    $i += $add;
    ( $add, $add2 ) = ( $add2, $add );
}

sub is_prime {
    for $j ( @primes ) {
        return 1 if $root < $j;
        next if ( $i % $j );
        return 0 if $i != $j;
    }
    return 1;
}

print sum @primes;

