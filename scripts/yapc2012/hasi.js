var sumPrimes = function(n) {
    var sup = Math.floor(n * (Math.log(n) + Math.log(Math.log(n))));
    var sieveSize = Math.floor(sup/2);
    var sieve = new Buffer(sieveSize);
    sieve.fill(0);
    var imax = Math.floor((Math.sqrt(sup)-1) / 2);
    for (var i = 1; i <= imax; i++) if (!sieve[i]) {
        var d = 2*i+1;
        for (var j = 2*i*(i+1); j < sieveSize; j += d) sieve[j] = 1;
    }
    var sum = 2;
    var num = 1;
    for (var i = 1; ; i++) if (!sieve[i]) {
        sum += 2*i+1;
        if (++ num >= n) return sum;
    }
}
console.log(sumPrimes(10000));


