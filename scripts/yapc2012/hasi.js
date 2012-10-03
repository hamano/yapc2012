var sumPrimes = function(n) {
    var sup = Math.floor(n * (Math.log(n) + Math.log(Math.log(n))));
    var sieveSize = Math.floor(sup/2);
    var sieve = new Buffer(sieveSize);
    sieve.fill(0);
    var imax = Math.floor(Math.sqrt(sieveSize / 2 - 0.25) - 0.5);
    for (var i = 1; i <= imax; i++) if (!sieve[i]) {
        var d = 2*i+1;
        for (var j = 2*i*(i+1); j < sieveSize; j += d) sieve[j] = 1;
    }
    var sum = 2+3+5;
    var num = 3;
    for (var i = 3; ; i += 15) {
        if (!sieve[i])    { sum += 2*i+ 1; if (++ num >= n) return sum; }
        if (!sieve[i+2])  { sum += 2*i+ 5; if (++ num >= n) return sum; }
        if (!sieve[i+3])  { sum += 2*i+ 7; if (++ num >= n) return sum; }
        if (!sieve[i+5])  { sum += 2*i+11; if (++ num >= n) return sum; }
        if (!sieve[i+6])  { sum += 2*i+13; if (++ num >= n) return sum; }
        if (!sieve[i+8])  { sum += 2*i+17; if (++ num >= n) return sum; }
        if (!sieve[i+11]) { sum += 2*i+23; if (++ num >= n) return sum; }
        if (!sieve[i+12]) { sum += 2*i+25; if (++ num >= n) return sum; }
    }
}
console.log(sumPrimes(10000));

