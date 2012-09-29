function isPrime(num){
  if(num>=3){
    if(num%2==0) {return false}
    for (var i=3;i*i<=num;i+=2) {
      if (num%i==0) {
        return false}}
    return true}
  else if(num<2){return false}
  else if(num==2){return true}
  else {return false}}

function nextOdd(num){
  if(num%2==0){num++}
  else{num+=2}
  return num}

function nextPrime(num){
  if(num<2){return 2}
  num=nextOdd(num)
  for (num;!isPrime(num);num+=2){}
  return num}

function sumPrimes(num){
  var n=0,sum=0,nth_prime=0
  for (n;n<num;n++){
    nth_prime = nextPrime(nth_prime)
    sum += nth_prime}
  return sum}

console.log(sumPrimes(10000))

