#!/usr/bin/perl
use utf8;
use strict;
my $total = 0;
my @sosu = ();
my $myNum;
my $check;

#多行エラトステネス法で数字を絞り込む
#前準備
for my $i (2..30) {
    $check = 1;
    for my $n (@sosu) {
      if ($n * $n > $i) {
        $check = 1;
        last;
      } elsif($i % $n ==0) {
        $check = 0;
        last;
      }
    }
    if ($check) {
      push @sosu,$i;
    }
}

for (my $j = 30; @sosu < 10000; $j +=30) {
  for my $k (1,7,11,13,17,19,23,29) {
    $myNum = $j + $k;
    $check = 1;
    for my $n (@sosu) {
      if ($n * $n > $myNum) {
        $check = 1;
        last;
      } elsif($myNum % $n ==0) {
        $check = 0;
        last;
      }
    }
    if ($check) {
      push @sosu,$myNum;
    }
  }
}
for (@sosu) {
  $total += $_;
}
print $total . "\n";
exit;

