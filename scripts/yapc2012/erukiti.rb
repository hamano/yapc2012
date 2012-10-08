#! /usr/bin/env ruby
#coding: utf-8

include Math

def sieve_fill(sieve, primary, max)
    n = primary * 7
    loop do
      return if n >= max; sieve[n] = true; n += primary * 4
      return if n >= max; sieve[n] = true; n += primary * 2
      return if n >= max; sieve[n] = true; n += primary * 4
      return if n >= max; sieve[n] = true; n += primary * 2
      return if n >= max; sieve[n] = true; n += primary * 4
      return if n >= max; sieve[n] = true; n += primary * 6
      return if n >= max; sieve[n] = true; n += primary * 2
      return if n >= max; sieve[n] = true; n += primary * 6
    end
end

def get_primary_sum(nums)
  return [2, 3, 5, 7][0...nums].inject(:+) if nums < 5

  max = (nums * log(nums) + nums * log(log(nums))).to_i
  max_sqrt = sqrt(max)
  sieve = Array.new(max)
  result = 2 + 3 + 5
  nums -= 3
  primary = 7

  loop do
    unless sieve[primary] then sieve_fill(sieve, primary, max) if primary < max_sqrt; result += primary; nums -= 1; return result if nums == 0; end; primary += 4
    unless sieve[primary] then sieve_fill(sieve, primary, max) if primary < max_sqrt; result += primary; nums -= 1; return result if nums == 0; end; primary += 2
    unless sieve[primary] then sieve_fill(sieve, primary, max) if primary < max_sqrt; result += primary; nums -= 1; return result if nums == 0; end; primary += 4
    unless sieve[primary] then sieve_fill(sieve, primary, max) if primary < max_sqrt; result += primary; nums -= 1; return result if nums == 0; end; primary += 2
    unless sieve[primary] then sieve_fill(sieve, primary, max) if primary < max_sqrt; result += primary; nums -= 1; return result if nums == 0; end; primary += 4
    unless sieve[primary] then sieve_fill(sieve, primary, max) if primary < max_sqrt; result += primary; nums -= 1; return result if nums == 0; end; primary += 6
    unless sieve[primary] then sieve_fill(sieve, primary, max) if primary < max_sqrt; result += primary; nums -= 1; return result if nums == 0; end; primary += 2
    unless sieve[primary] then sieve_fill(sieve, primary, max) if primary < max_sqrt; result += primary; nums -= 1; return result if nums == 0; end; primary += 6
    break if primary >= max_sqrt
  end

  loop do
    unless sieve[primary] then result += primary; nums -= 1; return result if nums == 0; end; primary += 4
    unless sieve[primary] then result += primary; nums -= 1; return result if nums == 0; end; primary += 2
    unless sieve[primary] then result += primary; nums -= 1; return result if nums == 0; end; primary += 4
    unless sieve[primary] then result += primary; nums -= 1; return result if nums == 0; end; primary += 2
    unless sieve[primary] then result += primary; nums -= 1; return result if nums == 0; end; primary += 4
    unless sieve[primary] then result += primary; nums -= 1; return result if nums == 0; end; primary += 6
    unless sieve[primary] then result += primary; nums -= 1; return result if nums == 0; end; primary += 2
    unless sieve[primary] then result += primary; nums -= 1; return result if nums == 0; end; primary += 6
  end
end

#if __FILE__ == $0
  puts get_primary_sum(10000)
#end


