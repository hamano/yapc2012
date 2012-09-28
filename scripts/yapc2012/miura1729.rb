#!/usr/bin/env ruby
# coding : utf-8
PNUM = 10000

#from Prime number theorem
MAXNUM = PNUM * Math.log(PNUM) * 1.2
FLAGS_SIZE = 16
FLAGS_NUM = MAXNUM / FLAGS_SIZE + 1
flg = Array.new(FLAGS_NUM, 0)
pno = 0
add = 0

curnum = 2

def set_flag(num, flg)
  cn = num
  while cn < MAXNUM
    flg[cn >> 4] |= (1 << (cn & 0xf))
    cn += num
  end
end

while pno != PNUM
  if flg[curnum >> 4] & (1 << (curnum & 0xf)) == 0 then
    set_flag(curnum, flg)
    add += curnum
    pno += 1
  end

  curnum += 1
end

p add
