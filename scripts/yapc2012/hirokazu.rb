def isPrime(n)
        $prime.each do |x|
                break if n<x*x
                return false if n%x==0
        end
        return true
end
$prime=[]
sum,cnt=2,1
i=3
while cnt<10000
        if isPrime(i)
                cnt+=1
                sum+=i
                $prime<<i
        end
        i+=2
end
puts sum

