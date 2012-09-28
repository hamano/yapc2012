require 'prime'

puts Prime.take(10000).inject(0){|l, r| l+r}
