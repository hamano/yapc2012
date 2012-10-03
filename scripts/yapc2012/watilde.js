(function (stdin) {
  var i = 13, count = 6, stdout = 28, primes = [2, 3, 5, 7, 11], mls = Math.log(stdin), maximum = Math.sqrt(stdin * (mls + Math.sqrt(mls)));
  function primeIs(n) {
    var j = 0, k = Math.sqrt(n);
    for (j; primes[j] <= k; j += 1) {
      if (n % primes[j] === 0) { return false; }
    }
    return true;
  }
  for (i; count <= stdin; i += 2) {
    if (primeIs(i)) {
      if (i <= maximum) { primes[primes.length] = i; }
      stdout += i;
      count += 1;
    }
  }
  console.log(stdout);
}(10000));


