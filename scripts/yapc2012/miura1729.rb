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
        if n == 16384 then
          14
        else
          15
        end
      else
        if n == 8192 then
          13
        else
          12
        end
      end
    else
      if n > 1024 then
        11
      else
        if n == 1024 then
          10
        else
          9
        end
      end
    end
  else
    if n > 16
      if n > 64
        if n == 128 then
          7
        else
          8
        end
      else
        if n == 64 then
          6
        else
          5
        end
      end
    else
      if n > 4
        if n == 16 then
          4
        else
          3
        end
      else
        if n == 4 then
          2
        else
          if n == 2 then
            1
          else
            0
          end
        end
      end
    end
  end
end

def main
  flg = Array.new(FLAGS_NUM, 0b0101010101010101)
  flg[0] |= 7
  pno = 3
  add = 2 + 3 + 5
  i = 0
  while i < FLAGS_NUM
    flg[i] |= 0b1001001001001001
    flg[i + 1] |= 0b0100100100100100
    flg[i + 2] |= 0b0010010010010010
    i = i + 3
  end

  i = 0
  while i < FLAGS_NUM
    flg[i] |= 0b1000010000100001
    flg[i + 1] |= 0b0100001000010000
    flg[i + 2] |= 0b0010000100001000
    flg[i + 3] |= 0b0001000010000100
    flg[i + 4] |= 0b0000100001000010
    i = i + 5
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
          if cn % 15 == 0 then
            while cn < MAXNUM
              # 0
              cn += stp1 

              # 1
              flg[cn >> 4] |= 1 << (cn & 0xf)
              cn += stp1 

              # 2
              flg[cn >> 4] |= 1 << (cn & 0xf)
              cn += stp1 

              # 3
              cn += stp1 

              # 4
              flg[cn >> 4] |= 1 << (cn & 0xf)
              cn += stp1 

              # 5
              cn += stp1 

              # 6
              cn += stp1 

              # 7
              flg[cn >> 4] |= 1 << (cn & 0xf)
              cn += stp1 

              # 8
              flg[cn >> 4] |= 1 << (cn & 0xf)
              cn += stp1 

              # 9
              cn += stp1 

              # 10
              cn += stp1 

              # 11
              flg[cn >> 4] |= 1 << (cn & 0xf)
              cn += stp1 

              # 12
              cn += stp1 

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
      end
      
      add += lcn
      pno += 1
    end
    
    curnum += 1
  end
  
  p add
end
    
main


