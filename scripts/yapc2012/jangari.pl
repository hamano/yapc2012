#!/usr/bin/perl

my @list = (2, 3);
my ($max, $sum, $count) = (9998, 5, 0);

for(my $i = 5, my $mod; $count < $max; ){
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
  $mod = $i % 6;
  if($mod == 5){
    $i += 2;
  }elsif($mod == 1){
    $i += 4;
  }
}
print $sum;
