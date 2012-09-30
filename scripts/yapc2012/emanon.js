function overNthPrime(n){
  // http://ja.wikipedia.org/wiki/%E7%B4%A0%E6%95%B0%E5%AE%9A%E7%90%86
  // n<=6の場合のみ
  // n番目周辺の値を大体で割り出すことができるっぽい
  var ln=Math.log,lnN=ln(n)
  var overNthPrime=n*(lnN+ln(lnN))
  return overNthPrime}

function sumPrimes(n){
  // overNthPrimeの利用できない部分
  // 5番目までは先に定義しておく
  var sum=0,primes=[2,3,5,7,11]
  if(1<=n&&n<=5){
    for(var i=0;i<n;i++){sum+=primes[i]}}
  if(6<=n){
    sum=28
    var primep=function(n){
      for(var i=0,j=Math.sqrt(n);primes[i]<=j;i++){
        if(n%primes[i]==0){return false}}
      return true}
    // 6番目以降から処理
    // 素数は6x+1,6x+5で表すことができるため
    // その位置を素数判定していく
    var count=6,maybePrime=13,inc=[4,2],inc_i=1
    var maxRoot=Math.sqrt(overNthPrime(n))
    for(maybePrime;count<=n;maybePrime+=inc[inc_i]){
      if(primep(maybePrime)){
        if(maybePrime<=maxRoot){
          primes.push(maybePrime)}
        sum+=maybePrime;count++}
      if(inc_i==0){inc_i++}
      else{inc_i=0}}}
  return sum}

console.log(sumPrimes(10000))
