var Prime = {
  is: function (n) {
    "use strict";
    if (n < 2) { return 0; }
    if (n === 2) { return 1; }
    if (n % 2 === 0) { return 0; }
    var i = 3;
    for (i; i * i <= n; i += 2) {
      if (n % i === 0) { return 0; }
    }
    return 1;
  },
  calc: function (stdin) {
    "use strict";
    var i = 1, count = 1, stdout = 0;
    for (i; stdin >= count; i += 1) {
      if (this.is(i) === 1) {
        count += 1;
        stdout += i;
      }
    }
    return stdout;
  }
};

var stdout = Prime.calc(10000);
console.log(stdout);
