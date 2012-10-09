primes = [2]
s = 2
n = 3
while len(primes) < 10000:
    for p in primes:
        if n < p * p:
            primes.append(n)
            s += n
            break
        if n % p == 0:
            break
    n += 1

print s

