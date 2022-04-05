def greetings(arr, hsh)
  "Hello, #{arr.join(' ')}! "\
  "Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
end

def twice(n)
  num, mid = n.digits, n.digits.size/2
  num[0...mid] == num[mid..-1] ? n : n * 2
end

def negative(n)
  # n > 0 ? n : -n
  -n.abs
end

def sequence(n)
  (1..n).to_a
end

def uppercase?(str)
  str.upcase == str
end

def word_lengths(str)
  str.split.map { |word| "#{word} #{word.length}" }
end

def swap_name(name)
  name.split.reverse.join(", ")
end

def sequence(count, num)
  (1..count).map { |i| num * i }
end

def get_grade(*scores)
  case scores.sum/scores.count
  when 90..    then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  else              'F'
  end
end

def buy_fruit(arr)
  arr.each.with_object([]) do |sub_arr, obj|
    sub_arr[1].times { obj << sub_arr[0] }
   end
end

def anagrams(arr)
  #solution using array
  sorted = arr.map { |word| word.chars.sort.join }
  sorted.uniq.map do |wrd|
    array = []
    arr.size.times { |i| array << i if sorted[i] == wrd }
    p array.map { |group| arr[group] }
  end
end

def anagram(arr)
  #solution using hash
  anagrams = Hash.new { |hash, key| hash[key] = [] }
  arr.each { |word| anagrams[word.chars.sort.join] << word }
  anagrams.values.each { |g| p g }
end
