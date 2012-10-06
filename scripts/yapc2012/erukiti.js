PARTITION = 6000

function get_primary_sum(nums) {
  var sieve = [];
  var result = [2, 3];
  nums -= 2;
  var primary = 3;
  var max = PARTITION;
  var sum = 5;

  while (nums > 0 && primary * primary < max) {
    var n = primary;
    while (n < max) {
      sieve[n] = true;
      n += primary;
    }

    while (sieve[primary]) primary += 2;

    result.push(primary);
    nums--;
    sum += primary;
  }

  // fix allignment
  while (nums > 0) {
    primary += 2;
    if (primary % 15 == 1) break;

    while (sieve[primary]) primary += 2;

    result.push(primary);
    nums--;
    sum += primary;
  }

  while (true) {
    // loop unrolling & thru [2, 3, 5] multiple
    if (!sieve[primary]) {result.push(primary); nums -= 1; sum += primary; if (nums == 0) break;} primary += 6; // +1
    if (!sieve[primary]) {result.push(primary); nums -= 1; sum += primary; if (nums == 0) break;} primary += 4; // +7
    if (!sieve[primary]) {result.push(primary); nums -= 1; sum += primary; if (nums == 0) break;} primary += 2; // +11
    if (!sieve[primary]) {result.push(primary); nums -= 1; sum += primary; if (nums == 0) break;} primary += 4; // +13
    if (!sieve[primary]) {result.push(primary); nums -= 1; sum += primary; if (nums == 0) break;} primary += 2; // +17
    if (!sieve[primary]) {result.push(primary); nums -= 1; sum += primary; if (nums == 0) break;} primary += 4; // +19
    if (!sieve[primary]) {result.push(primary); nums -= 1; sum += primary; if (nums == 0) break;} primary += 6; // +23
    if (!sieve[primary]) {result.push(primary); nums -= 1; sum += primary; if (nums == 0) break;} primary += 2; // +29

    // extend sieve
    if (primary >= max) {
      index = 3; // result[3] => 7
      while (result[index] * result[index] <= max + PARTITION) {
        prim = result[index];
        n = Math.floor(max / prim) * prim;
        while (n < max+ PARTITION) {
          sieve[n] = true;
          n += prim;
        }
        index++;
      }
      max += PARTITION;
    }
  }

  return sum;
}

console.log(get_primary_sum(10000));

