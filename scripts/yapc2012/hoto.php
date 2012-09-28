<?php

$time = microtime(true);

$i = 5;
$sum = 2+3;
$count = 10000 -2;

while ($count != 0){
  if (is_prime($i)){
    $count--;
    $sum += $i;
  }
  $i += 2;
}

function is_prime($n){
  $i = 3;
  $sqrt = sqrt($n);
  while ($n % $i != 0){
    if ($i>$sqrt) return true;
    $i += 2;
  }
  return false;
}

$time = microtime(true) - $time;

echo 'sum = ' . $sum . ', ' . 'time = ' . $time . '(sec)';

