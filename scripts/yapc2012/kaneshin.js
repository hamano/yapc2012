var sumPrimeNumber = function(n) {
  var logn = Math.log(n);
  var pn = ~~Math.sqrt(n * logn + n * Math.log(logn))
    , sum = 2
    , q = 1
    , p = []
    , len = 0
    , k = 0
    ;
  LOOP1: while (pn > q) {
    q += 2;
    k = 0;
    while(k < len)
      if (q % p[k++] == 0)
        continue LOOP1;
    sum += q;
    p[len++] = q;
  }
  var count = len + 1;
  LOOP2: while (n > count) {
    q += 2;
    k = 0;
    while(k < len)
      if (q % p[k++] == 0)
        continue LOOP2;
    sum += q;
    count++;
  }
  return sum;
}
console.log(sumPrimeNumber(10000));

