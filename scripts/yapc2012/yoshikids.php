<?php
// 既に結果がもらえているので
$cnt = 5;
$sum = 28;
$num = 13; // 2以上は奇数なので 13からとする
while(true) {
    $temp_sum = $sum;
    is_prime($num) !== FALSE && $sum += $num;
    $temp_sum !== $sum && ++$cnt;
    $cnt === 10000 && exit((string) $sum);
    $num+=2;
}

//素数判定関数
function is_prime($n){

    for ($i = 3; $i * $i <= $n;$i+=2) {
        if (!($n % $i)) {
            return FALSE;
        }
    }
    return $n;
}
?>

