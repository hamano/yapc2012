#!/usr/bin/perl

@p = (3,5,7,11); 
sub isprime{
  local( $n ) = @_;
  foreach $x ( @p ){
    if( $n % $x == 0 ){
      return 0;#false
    }elsif( $x * $x > $n ){
      return 1;#true
    }
  }
  return 1;
}

$sum = 2 + 3 + 5 + 7 + 11;
$i = 1;
$cnt = 5;

#all integer 12n + m ( n >= 0, m = 0..11)
#all prime(>12) 12n + m (n > 0, m = 1,5,7,11)
while(1){
  $p1 = 12 * $i + 1;
  $p5 = $p1 + 4;
  $p7 = $p5 + 2;
  $p11 = $p7 + 4;

  if(&isprime( $p1 )){
    push( @p,$p1 );
    $cnt++;
    $sum += $p1;
  }
  if(&isprime( $p5 )){
    push( @p,$p5 );
    $cnt++;
    $sum += $p5;
  }
  if(&isprime( $p7 )){
    push( @p,$p7 );
    $cnt++;
    $sum += $p7;
  }
  if(&isprime( $p11 )){
    push( @p,$p11 );
    $cnt++;
    $sum += $p11;
  }
  if($cnt >= 10000){
    if($cnt >= 1003){
      $cnt -= $p11;
    }
    if($cnt >= 1002){
      $cnt -= $p7;
    }
    if($cnt >= 1001){
      $cnt -= $p5;
    }
    last;
  }
  $i++;
}
print "$sum\n";

