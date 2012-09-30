use strict;
use warnings;

use List::Util qw(sum);

my @primexs = ();
my $num = 1;

p_counter : while ( @primexs < 10000 ) {
    $num >= 3 ? $num += 2 : $num++;
    my $num_sqrt = sqrt $num;
    for my $primex ( @primexs ) {
        last if $primex > $num_sqrt;
        next p_counter if $num % $primex == 0;
    }
    push ( @primexs, $num );
}

print sum( @primexs );
print "\n";

1;

