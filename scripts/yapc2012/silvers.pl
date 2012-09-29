#!/usr/bin/env perl
use strict;
use warnings;

my $MAX_NUM = 104729; # 裏技
my @table = (0..$MAX_NUM);
my $result = 2 + 3; # 最初だけ特別扱い

sub is_prime {
    my $num = shift;
    return unless $table[$num];
    $result += $num;

    # 素数の倍数はもういらないので判定ついでに落とす
    my $multi = $num * $num;
    while ( $multi <= $MAX_NUM ) {
        delete $table[$multi];
        $multi += $num;
    }
}

# 5以上の素数は6n-1, 6n+1であらわすことができる
my $n = 0;
while ( $n < $MAX_NUM ) {
    $n += 6;
    is_prime($n + $_) for (-1, 1);
}
print $result;
