n = 10_000
max_num = n * Math::log(n) + n * Math::log( Math::log(n) )
prime = Array.new(max_num, true)
prime[0] = false
# 素数の範囲は以下に限定される
(1..Math.sqrt(max_num).to_i).each do |i|
  # 導かれた素数で割り切れる数を消していく -- エラトステネスの篩
  if prime[i]
    ((i + 1)..(max_num / (i + 1).to_f).to_i).each do |j|
      prime[(i + 1)* j - 1] = false
    end
  end
end
sum = 0
n = 0
count = 0
while count < 10000
  if prime[n]
    sum += (n + 1)
    count += 1
  end
  n += 1
end
p sum
