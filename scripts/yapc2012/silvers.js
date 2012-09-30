var primes = [2, 3, 5, 7, 11]; // 問題で与えられてるから使うよ

var isPrime = function(n) {
  for (var i=0, l=primes.length; i < l; ++i) {
    if (n % primes[i] === 0) return false;
    if (primes[i] * primes[i] > n) return true;
  }
  return true;
};

var sumPrimes = function(primeCount) {
  // 今回の問題に関しては不要
  // var sum = 0;
  // if (primeCount <= primes.length) {
  //   for(var i=0; i < primeCount; ++i) sum += primes[i];
  // }
  // else {
    var i, t, n = 0, sum = 28; // sumは問題に載ってるから使うよ

    // 12以降の素数を12で割った余りは下のどれかになる
    var rest = [1, 5, 7, 11], rcount = 4;
    while ( true ) {
      n = n + 12;
      for (i=0; i < rcount; ++i) {
        t = n + rest[i];
        if ( isPrime(t) ) {
          sum += t;
          primes[primes.length] = t;
          if (primes.length >= primeCount) return sum;
        }
      }
    }
  // }
  return sum;
};

console.log( sumPrimes(10000));
