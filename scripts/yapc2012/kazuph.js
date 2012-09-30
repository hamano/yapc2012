var n = 10000;
var max_num = parseInt(n * Math.log(n) + n * Math.log( Math.log(n) ));
var prime = new Array(max_num);
prime[0] = true
// 素数の範囲は以下に限定される
var max_sqrt = n * Math.sqrt(max_num);
for (var i = 0 ; i < max_sqrt ; i++){
  // 導かれた素数で割り切れる数を消していく -- エラトステネスの篩
  if (!prime[i]){
    for (var j = i + 1 ; j < max_num / (i + 1.0) ; j++){
      prime[(i + 1)* j - 1] = true
    }
  }
}
var sum = 0
var n = 0
var count = 0
while (count < 10000){
  if (!prime[n]) {
    sum += (n + 1)
    count += 1
  }
  n += 1
}
console.log(sum);
