#!/usr/bin/env ruby
# coding : utf-8
# Ruby版
# どうもRubyの実行に
primes=[2,3]
primes_sum=5
cnt=2
number=5

while cnt != 10000
  i=1

  while number % (tmp=primes[i]) > 0

  if number < (tmp*tmp)
    primes[cnt] = number
      cnt+=1
      primes_sum+=number
      break
  end
    i+=1
  end

  number+=2
end

puts primes_sum
