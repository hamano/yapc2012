#!/usr/bin/env ruby
# coding : utf-8
require 'prime'

class PrimeList
  def initialize
    @lst = []
    @prime = Prime.instance
  end
  def [] n
    @lst[n] || to_nth(n)[n]
  end

  def to_nth (n)
    i = @lst[-1] || 0
    loop do
      @lst << i if @prime.prime? i
      break if @lst.length >= n
      i += 1
    end
    @lst
  end

  def self.sum_to_nth (n)
    new.to_nth(n).inject(:+)
  end
end

# if __FILE__ == $0
#   require 'benchmark'
#   Benchmark.benchmark do |b|
    # b.report{
puts PrimeList.sum_to_nth 10000
    # }
  # end
# end
