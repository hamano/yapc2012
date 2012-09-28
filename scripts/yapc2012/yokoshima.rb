max_count  = 10000
sum        = 0
skip_list  = Array.new
count      = 0
multiplier = 1

while 10 ** (multiplier + 1) <= max_count / 10
        multiplier += 1
end
max_num = (max_count * 10 * ( 1.1 ** multiplier  )).to_i

for i in 2..max_num
        next unless skip_list[i].nil?
        j = 2
        while i * j <= max_num
                skip_list[ i * j ] = 1
                j += 1
        end
        sum += i
        count += 1
        break if count >= max_count
end
puts sum


