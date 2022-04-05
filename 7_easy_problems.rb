def interleave(arr_1, arr_2)
  combined_arr = []
  arr_1.size.times do |i|
    combined_arr << arr_1[i] << arr_2[i]
  end
  combined_arr
end

def letter_case_count(str)
  hsh = {}
  hsh[:lowercase] = str.count('a-z') # or => str.scan(/[a-z]/).count
  hsh[:uppercase] = str.count('A-Z')
  hsh[:neither] = str.count ('^a-zA-Z')
  hsh
end

def word_cap(str)
  str.downcase.split.map(&:capitalize).join(" ")
end

def swapcase(str)
  str.chars.map do |char|
    if char =~ /[a-z]/
        char.upcase
      elsif char =~ /[A-Z]/
        char.downcase
      else
      char
    end
  end.join
end

def staggered_case(str)
  num = 0
  str.chars.map do |char|
    next(char) if char =~ /[^a-z]/i
    num += 1
    num.even? ? char.downcase : char.upcase
  end.join
end

def show_multiplicative_average(arr)
  result = arr.reduce { |total, i| total * i }
  "The result is " + format('%.3f', (result.to_f / arr.size))
end

def multiply_list(arr_1, arr_2)
  # arr_1.map.with_index { |el, idx| el * arr_2[idx] }
  arr_1.zip(arr_2).map { |e| e.reduce(&:*) }
end

def multiply_all_pairs(arr_a, arr_b)
  # result = []
  # arr_a.each do |a|
  #   arr_b.each do |b|
  #     result << a * b
  #   end
  # end
  # result.sort
  arr_a.product(arr_b).map { |a, b| a * b }.sort
end

def penultimate(str)
  str.split[-2]
end
