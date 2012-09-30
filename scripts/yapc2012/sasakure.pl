use strict;
use warnings;

use List::Util qw(sum);

my $max_num = 10000;
my @primexs = (2, 3);

if ( $max_num == 1 ) {
    print 2;
    exit;
}
if ( $max_num == 2 ) {
    print 5;
    exit;
}

my $num = 3;
p_counter : while ( @primexs < $max_num ) {
    $num += 2;
    my $num_sqrt = sqrt $num;
    for my $primex ( @primexs ) {
        last if $primex > $num_sqrt;
        next p_counter if $num % $primex == 0;
    }
    push ( @primexs, $num );
}

print sum( @primexs );

1;

