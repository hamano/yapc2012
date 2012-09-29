<?php
  $start = microtime(true);
  $s_list = array();

  // 5以下の素数をここで合算
  $total = 2 + 3; // 合計
  $cnt = 2; // 素数数
  $i = 1;

  // 5 以上の素数は全て、自然数 m を用いて 6m + 1 または6m － 1 の形で表すことができる（逆は成り立たない）。
  while(1)
  {
    $list = array((6 * $i) -1, (6 * $i) + 1);
    foreach ($list as $l)
    {
      $flg = false;

      // 平方根を用いて無駄な計算をパージ
      $sqrt = sqrt($l);
      foreach ($s_list as $s)
      {
        if ($s > $sqrt)
        {
          break;
        }
        if ($l % $s == 0)
        {
          $flg = true;
          break;
        }
      }
      if (!$flg)
      {
        $s_list[] = $l;
        $total += $l;
        $cnt++;
      }
    }
    if ($cnt == 10000)
    {
      break;
    }
    $i++;
  }

  $end = microtime(true);
  echo "total -- ". $total."\n";
  echo "time -- ".($end - $start)."\n";

