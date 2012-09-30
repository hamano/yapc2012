function sumPrimes(n){

  var sum=0;
  var primes=[2,3,5,7,11];

  if(6<=n){
    sum=28;
    var count=5;
    var maybe_prime=13;
    var inc=2;
    var ln_n=Math.log(n);
    var sqrt_max=Math.sqrt(n*(ln_n+Math.sqrt(ln_n)));
    outside_loop:
    for(maybe_prime;count<n;maybe_prime+=inc){
      inc=6-inc;
      inside_loop:
      for(var i=0,j=Math.sqrt(maybe_prime);primes[i]<=j;i++){
        if(maybe_prime%primes[i]==0){continue outside_loop;}};
      if(maybe_prime<sqrt_max){
        primes[count]=maybe_prime;}
      sum+=maybe_prime;
      count++;}}

  if(1<=n&&n<=5){
    for(var i=0;i<n;i++){sum+=primes[i];}}

  return sum;}

console.log(sumPrimes(10000));

