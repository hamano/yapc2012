var primes = [2, 3, 5, 7, 11]; // 問題で与えられてるから使うよ

var isPrime = function(n) {
  for (var i=0, l=primes.length; i < l; ++i) {
    if (primes[i] * primes[i] > n) break;
    if (n % primes[i] === 0) return;
  }
  return 1;
};

var sumPrimes = function(primeCount) {
  var sum = 0;
  var count = primes.length;
  if (primeCount <= count) {
    for(var i=0; i < primeCount; ++i) sum = sum + primes[i];
  }
  else {
    var n = 0;
    sum = 28; // 問題にあるから使うよ
    // 12以降の素数を12で割った余りは下のどれかになる
    var rest = [1, 5, 7, 11];
    var rcount = rest.length;
    while ( 1 ) {
      n = n + 12;
      for (var i=0; i < rcount; ++i) {
        var testNum = n + rest[i];
        if ( isPrime(testNum) ) {
          count = primes.push(testNum);
          sum = sum + testNum;
          if (count >= primeCount) return sum;
        }
      }
    }
  }
  return sum;
};

console.log( sumPrimes(10000));
