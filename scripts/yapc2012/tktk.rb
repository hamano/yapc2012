#!/usr/bin/env ruby
# coding : utf-8

max = 1050000
mark = Array.new(max + 1)

sum = 2
pn = 3 # current prime number
count = 1

while (pn <= max)
  count += 1
  sum += pn
  break if (count == 10000)

  # mark all multiply
  x = pn
  while (x <= max)
    x += pn * 2 # next odd number
    mark[x] = 1
  end

  # find next prime number
  pn += 2 # next odd number
  pn += 2 while (pn <= max && mark[pn] == 1)
end

puts sum
