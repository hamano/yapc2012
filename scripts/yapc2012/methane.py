def main(N):
    from math import log
    if N <= 6:
        return sum([2,3,5,7,11,13][:N])

    MAX_NUM = int(N*log(N) + N*log(log(N)) + 1)

    L = bytearray(MAX_NUM)
    F = bytearray(b'1' * MAX_NUM)
    S = 2
    i = 2
    L[::2] = F[::2]
    next = L.find

    for _ in xrange(N-1):
        i = next(b'\x00', i)
        S += i
        L[::i] = F[::i]

    return S

print main(10000)

