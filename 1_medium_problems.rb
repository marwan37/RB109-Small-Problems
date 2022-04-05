def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_number(num)
  rotate_array(num.digits.reverse).join.to_i
end

def rotate_rightmost_digits(num, n)
  digits = num.to_s.chars
  digits[-n..-1] = rotate_array(digits[-n..-1])
  digits.join.to_i
  #
  arr = num.digits.reverse
  arr.push(arr.delete_at(-n)).join.to_i
end

def max_rotation(num)
  size = num.to_s.size
  size.downto(2).map do |n|
    digits = num.to_s.chars
    digits[-n..-1] = rotate_array(digits[-n..-1])
    num = digits.join.to_i
  end
  num
end


def lights(n)
  arr = (1..n).to_a
  1.upto(n) do |i|
    arr.map!.with_index do |e, idx|
      (idx+1) % i == 0 ? (e == "on" ? "off" : "on") : e
    end
  end
  arr.map!{ |e| e == "on" ? arr.index(e)+1 : nil }.compact
end

def toggle_lights(n)
   hsh = (1..n).inject(Hash.new(0)){|h, k| h[k] += 1; h}
    2.upto(n) do |i|
      hsh.each do |k, v|
        k % i == 0 ? (v == 1 ? hsh[k] = 0 : hsh[k] = 1) : 0
    end
  end
  hsh.select {|k,v| v == 1}.keys
end


def diamonds(n)
  stars = (1..n).select(&:odd?).map { |e| "*"*e }
  spaces = stars.map { |i| " " * ((n - i.size) / 2) }
  grid = spaces.zip(stars).zip(spaces).each(&:flatten!)
  grid.each { |row| puts row.join }.pop
  grid.reverse_each { |row| puts row.join }
end

def hollow_diamond(n)
  stars = (1..n).select(&:odd?)
  stars.map! { |e| e > 1 ?  ("*" + " "*(e-2) + "*") : "*" }
  spaces = stars.map { |s| " "*((n-s.size)/2) }
  grid = spaces.zip(stars).zip(spaces).map(&:flatten)
  grid.each { |row| puts row[0] + row[1] + row[2] }.pop
  grid.reverse.each { |row| puts row[0] + row[1] + row[2] }
end

def diamonds(n)
  (1..n).step(2).each {|i| puts ("*" * i).center(n)}
  (1..n-2).step(2).reverse_each {|i| puts ("*" * i).center(n)}
end

def hollow_diamonds(n)
  (1..n).step(2).each do |i|
      puts(i > 1 ? ("*" + " "*(i-2) + "*").center(n) : "*".center(n))
    end
  (1..n-2).step(2).reverse_each do |i|
    puts(i > 1 ? ("*" + " "*(i-2) + "*").center(n) : "*".center(n))
  end
end
