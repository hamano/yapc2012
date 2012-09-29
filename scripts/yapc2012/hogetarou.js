// hogetarou.php hogetarou.rbの
// Javascript版
// 芸がなくてすみません。
// 速度的にはjsが一番早くて、rb,php,perlの順のようです。
// pythonは書けないので未確認
// ただ、言語ごとに得意不得意があると思うので、プログラム次第なんでしょうが
// 計測に使われている環境は rubyは1.9系 PHPは5.3系？のような気がします。

var primes=Array(2,3);
var primes_sum=5;
var cnt=2;

var number=5;
var i;

while (cnt != 10000) {
  i = 1;
  while (number % (tmp=primes[i])) {
    if (number < (tmp*tmp)) {
      primes[cnt++] = number;
      primes_sum+=number;
      break;
    }
    i++;
  }

  number+=2;
}

console.log(primes_sum);
