#!/usr/bin/env python -S
# coding: utf-8
from math import log

def main(N):
    if N <= 3:
        return sum([2,3,5][:N])

    # http://ja.wikipedia.org/wiki/素数定理
    # N 個目の素数 < MAX_NUM が証明されてる
    MAX_NUM = int(N*log(N) + N*log(log(N)) + 1)

    L = bytearray(MAX_NUM)
    F = b'1' * MAX_NUM
    S = 2
    i = 2
    L[::2] = F[::2]
    next = L.find

    for _ in xrange(N-1):
        i = next(b'\x00', i)
        S += i
        L[::i] = F[::i]

    return S

#import sys
#if 'bench' in sys.argv:
#    assert 496165411 == main(10000)
#    import timeit
#    print timeit.timeit(lambda: main(10000), number=100)

print main(10000)

