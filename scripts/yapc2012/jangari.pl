#!/usr/bin/perl
use strict;

my @list = (2);
my $max = 10000;
my $sum = 0;
my $count = 0;

for(my $i = 2; $count < $max; $i++){
  foreach(@list){
    if($_ > sqrt($i)){
      $count++;
      push @list, $i;
      $sum += $i;
      last;
    }
    if (($i % $_ == 0)){
      last;
    }
  }
}

print $sum;

