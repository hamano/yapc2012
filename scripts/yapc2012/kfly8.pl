use strict;
use warnings;
 
# XXX 素数定理の int ($N*log($N) + $N*log(log($N)) + 1) で抑えて計算したいけど、
# この近似値だとゆるすぎたので、１００００番目の素数を決め打ちで、、。
my $max = 104729;
 
# 問題文で与えられているものは事前準備
my $res         = 28;     # 5番目までの素数の和
my @composites  = ();
 
# XXX 問題分で与えられたものは、事前準備、、
for my $num ( qw/3 5 7 11/ ) {
   my $multi = $num * $num;
   while ( $multi < $max ) {
       $composites[$multi]++;
       $multi += $num;
   }
}
 
 
# 問題で与えられた11以上の素数は、12k+1,12k+5,12k+7,12k+11とあらわせる。
# なぜなら、11以上のすべての自然数は、自然数kを用いて、次のようにあらわせ、
# 12k, 12k+1, 12k+2, 12k+3, 12k+4, 12k+5, 12k+6, 12k+7, 12k+8, 12k+9, 12k+10, 12k+11
# このうち素数であるものは、偶数、3の倍数を除いて
#      12k+1,                      12k+5,        12k+7,                       12k+11
# の4通り。
# TODO この要領で効率よくできないかなー。
 
my $n = 0;
HOGE:while ( 1 ) {
 
    $n += 12;
 
    for my $num ($n + 1, $n + 5, $n + 7, $n + 11) {
 
        next if $composites[$num];
        last HOGE if $num > $max;
 
        $res += $num;
 
        # 足されたら、もう倍数には用はない
        my $multi = $num * $num; # XXX できれば計算したくない、、
        while ( $multi < $max ) {
            $composites[$multi]++;
            $multi += $num;
        }
 
    }
}
 
#use Test::More;
#is $res, 496165411;
#done_testing;
 
print $res;

