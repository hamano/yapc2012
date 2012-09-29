#!/usr/bin/env ruby
# coding : utf-8
PNUM = 10000

#from Prime number theorem
MAXNUM = (PNUM * Math.log(PNUM) * 1.14).to_i
FLAGS_SIZE = 16
FLAGS_NUM = MAXNUM / FLAGS_SIZE + 1

def ffs(n)
  n |= (n << 1)
  n |= (n << 2)
  n |= (n << 4)
  n |= (n << 8)
  n = ~n
  n -= ((n >> 1) & 0x5555)
  n = (n & 0x3333) + ((n >> 2) & 0x3333)
  n = (n + (n >> 4)) & 0x0f0f
  n *= 0x0101
  n >> 8 & 15
end

def main
  flg = Array.new(FLAGS_NUM, 0b0101010101010101)
  flg[0] |= 7
  pno = 2
  add = 2 + 3
  i = 0
  while i < FLAGS_NUM
    flg[i] |= 0b1001001001001001
    flg[i + 1] |= 0b0100100100100100
    flg[i + 2] |= 0b0010010010010010
    i = i + 3
  end

  curnum = 0
  while !(pno == PNUM)
    while !((lf = flg[curnum]) == 0xffff)
      off = ffs(~lf)

      lcn = (curnum << 4 ) + off

      flg[curnum] |= (1 << off)
      if lcn < 320 then
        cn = lcn * lcn
        stp1 = lcn * 2
        while cn < MAXNUM
          unless cn % 3 == 0 then
            flg[cn >> 4] |= 1 << (cn & 0xf)
          end
          cn += stp1
        end
      end

      add += lcn
      pno += 1
    end

    curnum += 1
  end

  p add
end

main
