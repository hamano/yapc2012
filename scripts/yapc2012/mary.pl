#!/usr/bin/env perl
#==================================================
# 速度だけが目的なので省けるものは全部省いてみた(w
#use strict;
#use warnings;
#--- 初期値で偶数省くとかもはや反則?... ---
my $max = shift || 10000;
my $sum = 2;
my @primes = (2);

my $i = 3;
while( @primes < $max ) {
    my $flag;

    foreach my $d ( @primes ) {
        last if ( $d*$d > $i);                          # 1000番目くらいなら sqrt の方が速い
        goto cnt unless ( $i % $d);                     # goto ...
    }
    $flag = 1;
    push( @primes, $i);

  cnt:
    $sum += $i if ( $flag );
    $i += 2;                                            # Only odd numbe
}

print $sum,"\n";

#==================================================
# XS とかもはや反則覆面レスラー版(w
# でも車輪の再発明をしない Perl 一般ユーザの王道;-)
#==================================================
# use strict;
# use warnings;
# use Math::Prime::XS qw(is_prime);
#
# my $max = shift || 10000;
# my $sum = 2;
# my $cnt = 1;
# my $i = 3;
#
# while( $cnt < $max ) {
#    if ( is_prime( $i )) {
#        $sum += $i;
#        $cnt++;
#    }
#    $i += 2;                                            # Only odd numbe
# }
# print $sum,"\n";
