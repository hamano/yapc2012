#!/usr/bin/env perl

sub sum_primes {
    my ($N, $logN, $max,$max2,@sieve);
    $N     = 10000;
    $logN  = log($N);
    $max   = int($N*$logN + $N*log($logN) +1 );
    $max2  = ($max-3)>>1;
    @sieve = (1)x$max2;

    my ($k,$j);
    for my $i (0 .. (sqrt($max)-3)>>1 ) {
        next unless $sieve[$i];
        $k = ($i<<1)+3;
        $j = $k*($i+1)+$i;
        while ($j <= $max2) {
            $sieve[$j] = undef;
            $j += $k;
        }
    }

    my $sum = 2;
    my $loop;
    for my $i (0 .. $max2) {
        next unless $sieve[$i];
        last if ++$loop == 10000;
        $sum += ($i<<1)+3;
    }

    return $sum;
}

print  sum_primes();

