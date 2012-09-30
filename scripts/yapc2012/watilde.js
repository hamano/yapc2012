function primeIs (n) {
  if (n % 2 === 0) { return 0; }
  var i = 3;
  for (i; i * i <= n; i += 2) {
    if (n % i === 0) { return 0; }
  }
  return 1;
}
(function () {
  var i = 2, count = 2, stdout = 2;
  for (i; 10000 >= count; i += 1) {
    if (primeIs(i) === 1) {
      count += 1;
      stdout += i;
    }
  }
  console.log(stdout);
})();

