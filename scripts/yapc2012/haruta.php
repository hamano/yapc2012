<?php
//function p() {
    $i = 12;
    $sosu_cnt = 2;
    $sosu_list = array(5, 7);
    $sosu_root_list = array(
        25 => 1,
        49 => 1,
    );
    while(1) {
        $inc_cnt = 0;
        while($inc_cnt < 2) {
            $p = $i;
            if ($inc_cnt) {
                ++$p;
            } else {
                --$p;
            }
            $div_p = $p >> 3;
            $j = 0;
            //if (isset($sosu_root_list[$p]) == false) {
                while($j < $sosu_cnt) {
                    $sosu = $sosu_list[$j];
                    if (!($p % $sosu)) {
                        break;
                    }
                    if ($div_p < $sosu) {
                        $sosu_list[] = $p;
                        ++$sosu_cnt;
                        //$sosu_root_list[$p*$p] = 1;
                        if ($sosu_cnt >= 9998) {
                        //if ($sosu_cnt >= 3) {
                            break 3;
                        }
                        break;
                    }
                    $j++;
                }
            //}
            ++$inc_cnt;
        }
        $i = $i + 6;
    }
    $sosu_list[] = 2;
    $sosu_list[] = 3;
    //var_dump(array_sum($sosu_list), $i);
    echo array_sum($sosu_list);
//}
//p();

