// loop unrolling and thru [2, 3, 5] multiple
// 7, 11, 13, 17, 19, 23, 29, 1

function sieve_fill(primary) {
  if (primary < max_sqrt) {
    var n = primary * 7;
    while (true) {
      if (n >= max) return; sieve[n] = true; n += primary * 4;
      if (n >= max) return; sieve[n] = true; n += primary * 2;
      if (n >= max) return; sieve[n] = true; n += primary * 4;
      if (n >= max) return; sieve[n] = true; n += primary * 2;
      if (n >= max) return; sieve[n] = true; n += primary * 4;
      if (n >= max) return; sieve[n] = true; n += primary * 6;
      if (n >= max) return; sieve[n] = true; n += primary * 2;
      if (n >= max) return; sieve[n] = true; n += primary * 6;
    }
  }
}

function get_primary_sum(nums) {
  if (nums < 5) {
    switch (nums) {
    case 0: return 0;
    case 1: return 2;
    case 2: return 2 + 3;
    case 3: return 2 + 3 + 5;
    case 4: return 2 + 3 + 5 + 7;
    }
  }

  max = Math.floor(nums * Math.log(nums) + nums * Math.log(Math.log(nums))); // Pierre Dusart
  max_sqrt = Math.sqrt(max)
  sieve = new Buffer(max); sieve.fill(0);
  var sum = 2 + 3 + 5;
  nums -= 3;
  var primary = 7;

  while (true) {
    if (!sieve[primary]) {sieve_fill(primary); sum += primary; if (--nums == 0) break;} primary += 4;
    if (!sieve[primary]) {sieve_fill(primary); sum += primary; if (--nums == 0) break;} primary += 2;
    if (!sieve[primary]) {sieve_fill(primary); sum += primary; if (--nums == 0) break;} primary += 4;
    if (!sieve[primary]) {sieve_fill(primary); sum += primary; if (--nums == 0) break;} primary += 2;
    if (!sieve[primary]) {sieve_fill(primary); sum += primary; if (--nums == 0) break;} primary += 4;
    if (!sieve[primary]) {sieve_fill(primary); sum += primary; if (--nums == 0) break;} primary += 6;
    if (!sieve[primary]) {sieve_fill(primary); sum += primary; if (--nums == 0) break;} primary += 2;
    if (!sieve[primary]) {sieve_fill(primary); sum += primary; if (--nums == 0) break;} primary += 6;
  }

  return sum;
}

console.log(get_primary_sum(10000));

