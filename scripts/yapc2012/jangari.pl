#!/usr/bin/perl

my @list = (2);
my ($max, $sum, $count) = (10000, 0, 0);

for(my $i = 2; $count < $max; $i++){
  foreach(@list){
    if($_ * $_ > $i){
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

