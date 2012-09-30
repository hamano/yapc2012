use strict;
use warnings;
use List::Util qw(sum);

my @primexs = ();
my $num = 1;

while ( @primexs < 10000 ) {
    $num >= 3 ? $num += 2 : $num++;
    my $is_p = 1;
    for my $primex ( @primexs ) {
        last if $primex * $primex > $num;
        if ( $num % $primex == 0 ) {
            $is_p = 0;
            last;
        }
    }
    push ( @primexs, $num ) if $is_p;
}

print sum( @primexs );
print "\n";

1;
