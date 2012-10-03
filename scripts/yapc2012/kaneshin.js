/*
 * - p{N} notes Nth prime number
 * The p{N} should be approximated by N * log(N) + N * log(log(N))
 * The variable of block means a size of buffer to use sieve (divided by 2)
 * The variable of trial means trial division for less computing
 */

(function(n) {
  var log_n = Math.log(n)
    , pn = n * log_n + n * Math.log(log_n)
    , block = pn >> 1
    , trial = ~~(Math.sqrt(pn))
    , buf = new Buffer(block)
    , sum = 2
    , p = 1
    , q = 0
    , count = 1
    ;
  buf.fill(0x00);
  while (count++ < n) {
    while(buf[++q]);
    sum += p = (q << 1) + 1;
    for (var i = q; q < trial && i < block; i += p)
      buf[i] = 0xFF;
  }
  console.log(sum);
})(10000);

