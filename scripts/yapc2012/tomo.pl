use strict;
use warnings;

my ($count,$sum) = (0,0);

for ( 2,3,5 ) {
    $count++;
    $sum += $_;
}

($a,$b) = (4,2);

my $i = 7;
while ( $count < 10000 ) {
    if ( is_prime($i) ) {
        $count++;
        $sum += $i;
    }

    $i += $a;
    ( $a, $b ) = ( $b, $a );
}

print $sum;

sub is_prime {
    my $i = shift;

    my $root = int(sqrt $i);

    for ( my $j = 3; $j <= $root; $j += 2 ) {
        next if ( $i % $j );
        return 0 if $i != $j;
    }

    return 1;
}

