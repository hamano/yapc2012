# import sympy as ts; ts.prime(10000)
# ===============================
# 104729
# import sympy as ts; sum(ts.primerange(1,104729+1))
# ===============================
# 496165411
# I have no any idea more than this
import time; startTimeAt = time.clock()
import math
N=104729+1

print 2+sum( k for k in range(3,N,2) if  not any(
                k % i == 0 for i in range(3, int(math.sqrt(k))+1, 2)
           )
      )
print "Total executing time:",time.clock() - startTimeAt

