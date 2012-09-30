#!/usr/bin/perl
use utf8;
use strict;
my $total = 0;
my @sosu = ();
my $myNum;

sub check_sosu {
    my $num = shift;
    for my $n (@sosu) {
        last if $n * $n > $num;
        return 0 if ($num % $n ==0);
    }
    return 1;
}

#多行エラトステネス法で数字を絞り込む
#前準備
for (2..30) {
    if (check_sosu($_)) {
        push @sosu,$_;
        $total += $_;
    }
}
for (my $i = 30; @sosu < 10000; $i +=30) {
    for my $j (1,7,11,13,17,19,23,29) {
        $myNum = $i + $j;
        if (check_sosu($myNum)) {
            push @sosu,$myNum;
            $total += $myNum;
        }
    }
}
print $total . "\n";
