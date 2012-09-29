#/usr/bin/perl
use strict;
use List::Util qw(first sum);
use Time::HiRes;
#my $start = Time::HiRes::time;  

## 30以下の素数
my @primes = (2, 3, 5, 7, 11, 13, 17, 19, 23, 29);
my $sum = sum @primes;
my $k = 3; # error prob = 4 ** -k
my $loop_cnt = 0;
my $loop_cnt2 = 0;
my $loop_cnt3 = 0;

## 素数の候補を返す。30(2*3*5)で割った余りが以下のものが素数の候補
my @rests = (1, 7, 11, 13, 17, 19, 23, 29);

## ミラー - ラビン素数判定法
sub is_prime {
  my $n = shift;
  return 0 if ( $n & 1 ) == 0;
  my $d = $n - 1;
  $d = $d >> 1 while ( $d & 1 ) == 0;
  for (my $i=0; $i < $k; $i++) {
    my $a = int(rand($n - 2)) + 1;
    my $t = $d;
    my $y = pow($a, $t, $n);
    while (($t != $n-1) && ($y != 1) && ($y != $n -1)) {
      $loop_cnt ++ ;
      $y = ($y * $y) % $n;
      $t = $t << 1;
    }
    return 0 if ( ($y != $n -1) && (($t & 1) == 0) );
  }
  return 1;
}

sub pow {
  my ($base, $power, $mod) = @_;
  my $result = 1;
  while ($power > 0 ) {
    $loop_cnt++;
    $result = ($result * $base) % $mod if $power & 1 == 1;
    $base = ($base * $base) % $mod;
    $power >>= 1;
  }
  return $result;
}

my $i = 0;
while (@primes < 50000) {
  #$loop_cnt3 ++;
  $i += 30;
  foreach my $rest (@rests) {
    my $n = $i + $rest;
    if ( is_prime($n) ) {
      push(@primes, $n);
      $sum += $n;
    }
  }
  #print "next:".$n."\n";
}

#print $primes[-1]."\n";
print $sum."\n";
print "loop_cnt: $loop_cnt\n";
#printf("%0.3f",Time::HiRes::time - $start); 
#print "loop_cnt: $loop_cnt2\n";
#print "loop_cnt: $loop_cnt3\n";
