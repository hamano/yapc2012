#!/usr/bin/perl
use strict;
use Time::HiRes;
my $start = Time::HiRes::time; 

my $cnt = 0;
my $max_count = 10000;
my $sum = 0;
my $j = 0;
while($cnt != $max_count) {
  
  if (&IsPrime($j)){
    $sum = $sum + $j;
    $cnt++;
  }
  $j++;
}

print($sum."\n");
printf("%0.5f",Time::HiRes::time - $start); 


sub IsPrime() {
  my $n = shift;
  
  return 0 if $n < 2;
  return 1 if $n == 2;
  return 0 if ($n & 1) == 0;
  
  for (my $i=3; $i*$i <= $n; $i+=2) {
    return 0 if $n % $i == 0;
  }
  
  return 1;
}

