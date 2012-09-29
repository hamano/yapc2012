require "prime"
sum = 0
cnt = 0
Prime.each(nil){|x|
  if cnt >= 10000
    break
  end
  cnt += 1
  sum += x
}
p sum

