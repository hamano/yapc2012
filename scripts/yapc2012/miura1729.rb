PNUM = 10000

#from Prime number theorem
MAXNUM = (PNUM * Math.log(PNUM) * 1.14).to_i
FLAGS_SIZE = 16
FLAGS_NUM = MAXNUM / FLAGS_SIZE + 1

def ffs(n)
  n = n & (-n)
  if n > 256 then
    if n > 2048 then
      if n > 8192 then
        15
      else
        13
      end
    else
      if n > 1024 then
        11
      else
        9
      end
    end
  else
    if n > 16
      if n > 64
        7
      else
        5
      end
    else
      if n > 4
        3
      else
        1
      end
    end
  end
end

def init
  flg = [0b1101011101111101, 
         0b101111101110101, 
         0b111010111011111, 
         0b1101011111011101, 
         0b101110101110111, 
         0b1111010111110111, 
         0b1101011101011101, 
         0b111110101111101, 
         0b111010111010111, 
         0b1101111101011111, 
         0b1101110101110101, 
         0b111011111010111, 
         0b1111011101011101, 
         0b101110111110101, 
         0b111110111010111] * ((FLAGS_NUM / 15) + 1)
  
  flg[0] |= 7
  flg
end

def main
  cn = 0
  stp1 = 0
  stp2 = 0
  stp3 = 0
  flg = init
  pno = 3
  add = 2 + 3 + 5

  base = 0
  lcn = 0
  while lcn < 318
    while (lf = flg[base]) < 0xffff
      lcn = (base << 4 ) + ffs(~lf)
      flg[base] |= (1 + lf)

      cn = lcn * lcn
      stp1 = lcn * 2
      while cn < MAXNUM
        if cn % 15 == 0 then
          stp2 = lcn * 4
          stp3 = lcn * 6
          while cn < MAXNUM
            # 0
            cn += stp1 
            
            # 1
            flg[cn >> 4] |= 1 << (cn & 0xf)
            cn += stp1 
            
            # 2
            flg[cn >> 4] |= 1 << (cn & 0xf)
            # 3
            cn += stp2 
            
            # 4
            flg[cn >> 4] |= 1 << (cn & 0xf)
            # 5
            # 6
            cn += stp3
            
            # 7
            flg[cn >> 4] |= 1 << (cn & 0xf)
            cn += stp1 
            
            # 8
            flg[cn >> 4] |= 1 << (cn & 0xf)
            # 9
            # 10
            cn += stp3
            
            # 11
            flg[cn >> 4] |= 1 << (cn & 0xf)
            # 12
            cn += stp2
            
            # 13
            flg[cn >> 4] |= 1 << (cn & 0xf)
            cn += stp1 
            
            # 14
            flg[cn >> 4] |= 1 << (cn & 0xf)
            cn += stp1 
          end
        else
          flg[cn >> 4] |= 1 << (cn & 0xf)
          cn += stp1 
        end
      end

      add += lcn
      pno += 1
    end
    base += 1
  end

  while pno < PNUM
    lf = flg[base]
    while lf < 0xffff
      add += (base << 4 ) + ffs(~lf) 
      lf |= (1 + lf)
      pno += 1
    end
    base += 1
  end
  
  p add
end

main

