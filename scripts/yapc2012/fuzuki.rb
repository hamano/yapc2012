#ruby

def prime?(n,plis)
  plis.each{|x|
    if n % x == 0
      return false
    elsif x * x > n
      return true
    end
  }
  return true
end

cnt = 5
sum = 2 + 3 + 5 + 7 + 11
i = 1
plis = [3,5,7,11]
while true
  p1 = 12 * i + 1
  p5 = p1 + 4
  p7 = p5 + 2
  p11 = p7 + 4
  if prime?(p1,plis)
    sum += p1
    plis << p1
    cnt += 1
  end
  if prime?(p5,plis)
    sum += p5
    plis << p5 
    cnt += 1
  end
  if prime?(p7,plis)
    sum += p7
    plis << p7
    cnt += 1
  end
  if prime?(p11,plis)
    sum += p11 
    plis << p11 
    cnt += 1
  end

  if cnt >= 10000
    if cnt >= 10003
      sum -= p11
    end
    if cnt >= 10002
      sum -= p7
    end
    if cnt >= 10001
      sum -= p5
    end
    break
  end
  i += 1
end
p sum

