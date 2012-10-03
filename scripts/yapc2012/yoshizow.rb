# -*- ruby -*-

include Math

def prime_sum(nth)
  raise 'range error' if nth <= 5

  sieve_size = (nth * log(nth) + nth * log(log(nth)) / 2).floor
  sieve = Array.new(sieve_size)  # sieve[i] is for 2*i+1
  count = 1
  sum = 2
  p = nil
  q = 1
  while true
    while sieve[q]
      q += 1
    end
    p = 2 * q + 1
    # p p
    count += 1
    sum += p
    if count >= nth
      return sum
    end
    i = q
    while i < sieve_size
      sieve[i] = true
      i += p
    end
  end
end

#nth = if ARGV.length > 0 then ARGV[0].to_i else 10000 end
nth = 10000
result = prime_sum(nth)
p result

