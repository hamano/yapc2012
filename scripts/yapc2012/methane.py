#!/usr/bin/env python -S
MAX_NUM = 105000

def main():
    L = bytearray(MAX_NUM)
    F = b'1' * MAX_NUM
    S = 2
    i = 3
    l = 1
    L[::2] = F[::2]

    for i in xrange(3, MAX_NUM, 2):
        if l >= 10000:
            break
        if L[i]:
            continue
        S += i
        L[::i] = F[::i]
        l += 1

    return S

#import sys
#if 'bench' in sys.argv:
#    assert 496165411 == main()
#    import timeit
#    print timeit.timeit(main, number=100)

print main()
