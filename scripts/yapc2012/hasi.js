var sumPrimes = function(n) {
    var sieveSize = Math.floor(n * (Math.log(n) + Math.log(Math.log(n))) / 2 + 0.5);
    var mod = [1, 7, 11, 13, 17, 19, 23, 29];
    var rem = new Buffer(15);
    rem.fill(0);
    for (var i = 0; i < mod.length; ++ i) rem[(mod[i]-1)/2] = 1;
    var sieve = new Buffer(sieveSize);
    sieve.fill(0);
    var imax = Math.floor(Math.sqrt(sieveSize / 2 - 0.25) - 0.5);
    for (var i = 1; i <= imax; i++) if (!sieve[i]) {
        var s = 2*i*(i+1);
        var d = (2*i+1)*15;
        for (var l = 0; l < 15; ++ l) {
            if (rem[s%15]) for (var j = s; j < sieveSize; j += d) sieve[j] = 1;
            s += 2*i+1;
        }
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

