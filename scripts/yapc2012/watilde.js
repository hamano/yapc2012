function isPrime(n) {
  if (n < 2) {
    return 0;
  } else if (n === 2) {
    return 1;
  }
  if (n % 2 === 0) {
    return 0;
  }
  var i = 3;
  for (i; i * i <= n; i += 2) {
    if (n % i === 0) {
      return 0;
    }
  }
  return 1;
}

function calcPrime(stdin) {
  var i = 1, count = 1, stdout = 0;
  for (i; stdin >= count; i += 1) {
    if (isPrime(i) === 1) {
      count += 1;
      stdout += i;
    }
  }
  return stdout;
}

var stdout = calcPrime(10000);
console.log(stdout);
