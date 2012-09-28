#!/usr/bin/env python -S
def main():
    P = [2]
    add = P.append
    l = 1

    i = 3
    while l < 10000:
        x = i ** 0.5
        for p in P:
            if p > x:
                add(i)
                l += 1
                #print l, i, s
                break
            if i % p == 0:
                break
        i += 2
    return sum(P)

print main()

