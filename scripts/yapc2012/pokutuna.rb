require 'prime'
puts Prime.take(10000).inject(&:+)

