def isPrime(n)
  i=3
  while i*i<=n do
    return false if n%i==0
    i+=2
  end
  return true
end
sum,c=2,1
i=3
while c<10000 
  if isPrime(i)
    sum+=i
    c+=1
  end
  i+=2
end
puts sum

