#!/usr/bin/env perl
#my @primes;
#my ($cnt, $sum) = (0, 0);
my $i = 2;
my $max = shift || 10000;

while( $cnt < $max ) {
    my $flag;

    if ( $i >= 2 ) {
        for my $d ( @primes ) {
            last if ( $d*$d > $i);
            goto HOGE if( !( $i % $d));
        }
        $flag = 1;
        push( @primes, $i);
    }

  HOGE:
    if ( $flag ) {
        $sum += $i;
        $cnt++;
    }

    if ( $i == 2 ) {
        $i++;
    }
    else {
        $i += 2;
    }
}

print $sum,"\n";


