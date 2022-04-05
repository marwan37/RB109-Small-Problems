def sum_of_sums(arr)
  arr.map.with_index do |_, i|
    arr[0..i].sum
  end.sum
end

def madlibs
  print "Enter a noun: "
  noun = gets.chomp
  print "Enter a verb: "
  verb = gets.chomp
  print "Enter an adjective: "
  adjective = gets.chomp
  print "Enter an adverb: "
  adverb = gets.chomp
  puts ""
  puts "Do you #{verb} with your #{adjective} #{noun} #{adverb}? Amazing!"
  puts "Don't you dare #{verb} with my #{adjective} #{noun} #{adverb}!"
end

def leading_substrings(str)
  (0...str.size).map do |i|
    str[0..i]
  end
end

def substrings(str)
  (0...str.size).flat_map do |i|
   leading_substrings(str[i..-1])
  end
end

def palindromes(str)
  substrings(str).select do |ss|
    ss == ss.reverse && ss.size > 1
  end
end

def fizzbuzz(n1, n2)
  (n1..n2).map do |num|
    num % 3 == 0 ? (num % 5 == 0 ? 'FizzBuzz' : 'Fizz') : num
  end.join(", ")
end

def repeater(str)
  # (.) parentheses allow to capture groups
  # \1\1 doubles each character that matches the group
  str.gsub(/(.)/, '\1\1' )
end

def double_consonants(str)
  # \d returns all digits
  # \W returns all non-word special characters + spaces, but not digits
  str.gsub(/([^aeiou\d\W])/, '\1\1')
end

def reversed_number(num)
  # .digits returns an array of reversed digits
  num.digits.join.to_i
end

def center_of(str)
  return str[str.size/2] if str.size.odd?
  str[(str.size/2)-1, 2] if str.size.even?
end
