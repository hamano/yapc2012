MAX = 10000

expcount = MAX
while MAX > expcount / Math.log expcount
  expcount= expcount * 2

findPrime = (plst,lst)->
 plen = plst.length
 llen = lst.length
 while not (plst[plen-1]*plst[plen-1] > lst[llen-1])
  plst[plen] = p = lst.shift()
  tmp = []
  for n in lst
   if n%p isnt 0
    tmp[tmp.length] = n
  lst = tmp
  plen = plst.length
  llen = lst.length
 [].concat plst,lst
plst = (findPrime [],[2..expcount])
plst.length = MAX
console.log plst.reduce (a,b)-> a+b
