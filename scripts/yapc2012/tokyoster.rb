# 問題文にあった2,3,5,7,11は既知とする．
# 既知の素数を使って最初に検索しなくて良い範囲を除去する"ふるい"を作っておく
# 検索するときも，最初から2個飛びであることを既知として用いる
PRIME_TOTAL_NUM=10000
@known_primes = Array.new(PRIME_TOTAL_NUM)
@known_primes[0]=2
@known_primes[1]=3
@known_primes[2]=5
@known_primes[3]=7
@known_primes[4]=11

@prime_num = 5
@prime_sum = @known_primes[0..@prime_num-1].inject(0){|sum,i|sum+=i}

# 素数チェック関数
def check_prime(num)
  num_sqrt = (Math.sqrt(num)).round
  # 素数の剰余を計算する候補を減らす
  # ふるいにかけることを前提として，ふるいに使用されていない素数だけ調べる
  for prime in @known_primes[5..@prime_num-1]
    if num % prime == 0
      return# false
    end
    if prime > num_sqrt
      break
    end
  end
  @known_primes[@prime_num] = num
  @prime_num += 1
  @prime_sum += num
  return# true
end

# ふるいの作成
sieve_length = 1+@known_primes[0..@prime_num-1].inject(1){|product,i|product*=i}
sieve = Array.new(sieve_length,1)
# ふるいの幅に1を足しておいたのは，この端の値でふるいの範囲外検出＆リセットするため
sieve[sieve_length-1] = 2
# 計算しなくて良い部分は0として，計算しなくて良いフラグをたてることにする
for i in @known_primes[0..@prime_num-1]
  (i-1..sieve_length-1).step(i){|j|sieve[j]=0}
end
#p sieve

# ふるいの目をみて，ふるいに引っかかった時(sieve[sieve_count]=1))だけ素数チェック
i = @known_primes[@prime_num-1]+2
sieve_count = i
while(@prime_num < PRIME_TOTAL_NUM)
  case sieve[sieve_count-1]
  when 0  
  when 1
    #p i
    check_prime(i)
  when 2
  # ふるいの参照位置をリセットして再実行
    sieve_count = 1
    redo
  end
  i += 2
  sieve_count += 2
end

# 出力
p @prime_sum

