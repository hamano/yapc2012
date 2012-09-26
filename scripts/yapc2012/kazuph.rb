#!/usr/bin/env ruby
t = Time.now
max = 10000
def prime?(num, ary)
  ary.each do |n|
    break if n * n  > num
    return false if num % n == 0
  end
  return true
end
n = 0
prime_ary = [2, 3, 5]
while  prime_ary.count < max
  n += 1
  prime = 6 * n + 1
  if prime?(prime, prime_ary)
    prime_ary.push(prime)
  end
  prime += 4
  if prime?(prime, prime_ary)
    prime_ary.push(prime)
  end
end
p prime_ary.inject(:+)
p Time.now - t
