function primep(num){
  if (num > 1) {
    var i=2,j=Math.sqrt(num)
    for (i;i<=j;i++){
      if (num % i == 0){
        return false}}
    return true}
  else{
    return false}}

function next_prime(num){
  for (num++;!primep(num);num++){}
  return num}

function sum_primes(num){
  var n=0,sum=0,nth_prime=0
  for (n;n<num;n++){
    nth_prime = next_prime(nth_prime)
    sum += nth_prime}
  return sum}

console.log(sum_primes(10000))
