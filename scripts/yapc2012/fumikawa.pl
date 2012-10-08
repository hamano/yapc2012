#!/usr/bin/perl
use strict;
$| = 1;
################################################################################
# prime.pl {count (default: 10000)}
#
# ... Find given number of prime numbers and return total of them.
################################################################################

# process parameter
#my $COUNT = $ARGV[0];
#$COUNT = 10000 if !$COUNT;
my $COUNT = 10000;
#die "give number of prime numbers to sum up!" if $COUNT !~ /^\d+$/;

# use first 2 primes for seed.
my @PRIMES=(2, 3);

################################################################################
# call main with given count.
# main function prints the total
################################################################################
main($COUNT);
#exit(0);

sub main(){
  my $cnt = shift @_;
  my $total = totalPrime($cnt);
  print "TOTAL up to ${cnt}th : $total\n";
}

################################################################################
# Returns first n prime numbers summed
################################################################################
sub totalPrime(){
  my $cnt = shift @_;
  return 0 if $cnt <= 0;
  return 2 if $cnt == 1;
  return 5 if $cnt == 2;

  my $total=5;
  for(my $i = 2; $i < $cnt ; $i ++){
    $total += nextPrime();
  }
  return $total;
}

################################################################################
# Returns next prime number and append @PRIMES
################################################################################
sub nextPrime(){
  my $next = 2 + $PRIMES[scalar( @PRIMES ) -1];
  my $sqrt = sqrt $next;
  while(){
    my $isPrime = 1;
    for(@PRIMES){
      if($next % $_ == 0){
        $isPrime = 0;
        last;
      }
      if($_ > $sqrt){
        last;
      }
    }
    if($isPrime){
      push(@PRIMES, $next);
      last;
    }
    $next += 2;
    $sqrt = sqrt $next;
  }
  return $next;
}


