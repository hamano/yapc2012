<?php
/**
 * 素数判定
 *  第一引数に何件までの素数を求めるか指定できます。default = 10,000
 *  処理速度をあげる工夫としては、偶数は無視し、割る数字を判定対象の数字の平方根以下としました。
 *  ※time_diff関数は、素数判定には関係しません。速度計測用の独自関数です。
 */

$count = isset($argv[1]) && is_numeric($argv[1]) ? $argv[1] : 10000;

//echo date("Y-m-d H:i:s")."\n";
echo time_diff("", array(), false)."\n";

$i = 1;
$primes = array(2);
while ( count($primes) < $count ) {
        while ( !is_prime($i) ) {
                $i += 2;
        }
        $primes[] = $i;
        $i += 2;
        //if ( $i > 100 ) break;
}
//print_r($primes);
for ( $i = 0; $i < count($primes); $i++ ) {
        //if ( $i < 6 || $i > (count($primes) - 5) ) echo $primes[$i]."\n";
}

echo count($primes)."\n";
echo time_diff("", array(), false)."\n";
echo array_sum($primes)."\n";
echo time_diff("", array(), false)."\n";

// 素数判定関数
function is_prime($val) {
        if ( $val < 2 ) return false;
        if ( $val == 2 || $val == 3 ) return true;
        $i = 3;
        $sqrt_val = sqrt($val);
        while ( ($val % $i) != 0 ) {
                if ( $i > $sqrt_val ) return true;
                $i += 2;
        }
        return false;
}

function time_diff( $word="", $options=array() , $print=true ) {
        static $times;

        $indent_length = 0;

        $prefix = "time_diff";
        if ( isset($options["prefix"]) && $options["prefix"] ) $prefix .= "({$options['prefix']})";
        if ( !isset($times[$prefix]) || (isset($options["clear"]) && $options["clear"] === true) ) $times[$prefix] = array();
        if ( isset($options["prefix"]) ) $indent_length = intval($options["indent_length"]);
        if ( count($times[$prefix]) != 0 ) $indent_length++;
        if ( isset($options["linefeed"]) && $options["linefeed"] ) $linefeed = $options["linefeed"];
        else if ( !isset($_SERVER["DOCUMENT_ROOT"]) || $_SERVER["DOCUMENT_ROOT"] == "" ) $linefeed = "\n";
        else $linefeed = "<br />\n";
        $indent_word_length = 2;

        //var_dump($indent_word_length);

        $indent = str_pad("", ($indent_length*$indent_word_length), " ", STR_PAD_LEFT);

        $i = count($times[$prefix]);
        $temp = explode(" ", microtime());
        $times[$prefix][$i] = array($temp[1], substr($temp[0], 2));
        $log = $prefix." ".date("[Y-m-d H:i:s.{$times[$prefix][$i][1]}]", $times[$prefix][$i][0]);
        //print_r($times[$prefix]);
        if ( count($times[$prefix]) > 1 ) {
                $log .= "(";
                // 最初にはかった時間からの時間
                $time = $times[$prefix][$i][0] - $times[$prefix][($i-1)][0];
                $microtime = $times[$prefix][$i][1] - $times[$prefix][($i-1)][1];
                if ( $microtime < 0 ) {
                        $time--;
                        $microtime = 100000000 + $microtime;
                }
                $microtime = sprintf("%08d", $microtime);
                $log .= $time.".".$microtime;

                if ( count($times[$prefix]) > 2 ) {
                        // 前回からの時間
                        $time = $times[$prefix][$i][0] - $times[$prefix][0][0];
                        $microtime = $times[$prefix][$i][1] - $times[$prefix][0][1];
                        if ( $microtime < 0 ) {
                                $time--;
                                $microtime = 100000000 + $microtime;
                        }
                        $microtime = sprintf("%08d", $microtime);
                        $log .= ", ".$time.".".$microtime;
                }
                $log .= ")";
        }
        $log .= " ".$word;
        if ( $print ) echo $indent.$log.$linefeed;
        else return $log;
}

