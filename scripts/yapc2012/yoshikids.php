<?php
// 既に結果がもらえているので
$cnt       = 5;
$sum       = 28;
$num       = 13; // 3以上は奇数なので 13からとする
$max_count = 10000;

for ($cnt; $cnt < $max_count;) {
    if (is_prime($num) !== FALSE) {
        ++$cnt;$sum += $num;
    }
    $num+=2;
}
echo $sum;

//素数判定関数
function is_prime($n){

    for ($i = 3; $i * $i <= $n;$i+=2) {
        if (!($n % $i)) {
            return FALSE;
        }
    }
    return $n;
}

