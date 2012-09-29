#!/usr/bin/env ruby
# coding : utf-8
PNUM = 10000

#from Prime number theorem
MAXNUM = PNUM * Math.log(PNUM) * 1.14
FLAGS_SIZE = 16
FLAGS_NUM = MAXNUM / FLAGS_SIZE + 1

def popcnt(n)
  n = n - ((n >> 1) & 0x5555)
  n = (n & 0x3333) + ((n >> 2) & 0x3333)
  n = (n + (n >> 4)) & 0x0f0f
  n *= 0x0101
  n >> 8 & 15
end


def ffs(n)
  n = n | (n << 1)
  n = n | (n << 2)
  n = n | (n << 4)
  n = n | (n << 8)
  popcnt(~n)
end

def main
  flg = Array.new(FLAGS_NUM, 0b0101010101010101)
  flg[0] |= 7
  pno = 1
  add = 2

  curnum = 0
  while true
    while (lf = flg[curnum]) != 0xffff
      off = ffs(~lf)

      lcn = (curnum << 4 ) + off

      cn = lcn * (lcn - 1)
      if lcn == 3 then
        i = 0
        while i < FLAGS_NUM
          flg[i] |= 0b1001001001001001
          flg[i + 1] |= 0b0100100100100100
          flg[i + 2] |= 0b0010010010010010
          i = i + 3
        end
      else
        flg[curnum] |= (1 << off)
        while cn < MAXNUM
          flg[cn >> 4] |= (1 << (cn & 0xf))
          cn += lcn
        end
      end

      add += lcn
      pno += 1
      if pno == PNUM then
        p add
        return
      end
    end

    curnum += 1
  end
end

main
