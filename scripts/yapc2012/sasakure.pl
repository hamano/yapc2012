use List::Util qw(sum);

my @primexs = (2, 3, 5);

my $num = 5;
p_counter : while ( @primexs < 10000 ) {
    $num += 2;
    my $num_sqrt = sqrt $num;
    for my $primex ( @primexs ) {
        last if $primex > $num_sqrt;
        next p_counter if $num % $primex == 0;
    }
    push ( @primexs, $num );
    $num += 2;
    $num_sqrt = sqrt $num;
    for my $primex ( @primexs ) {
        last if $primex > $num_sqrt;
        next p_counter if $num % $primex == 0;
    }
    push ( @primexs, $num );
    $num += 2;
}

print sum( @primexs );

