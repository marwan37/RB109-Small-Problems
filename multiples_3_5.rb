# write a method that searches
# for all multiples of 3 and 5 between 1 and some other number
# computes the sum of those multiples

def multisum(num)
  arr = (1..num).to_a.select { |i| i % 3 == 0 || i % 5 == 0 }
  arr.reduce(:+)
end


# write a method that takes an array of numbers
# returns array with same number of elements
# each element has the running tota from the original array

def running_total(arr)
  sum = 0
  arr.map { |value| sum += value }
end

# string.to_i old fashioned way

def create_digit_hash
  hsh = {}
  (0..9).to_a.each { |num| hsh[num.to_s] = num }
  hsh
end

def create_hex_hash
  hsh = {}
  (0..9).to_a.each { |num| hsh[num.to_s] = num }
  hsh['A'] = 10
  hsh['B'] = 11
  hsh['C'] = 12
  hsh['D'] = 13
  hsh['E'] = 14
  hsh['F'] = 15
  hsh
end


def string_to_integer(str)
  number = 0
  digit_hash = create_digit_hash
  digits = str.chars.map {|n| n = digit_hash[n] }
  digits.reverse.each_with_index do |digit, idx|
    if idx == 0
      number += digit
    else
      number += digit * (10 ** idx)
    end
  end
  number
end

p string_to_integer("45678")

def hex_to_int(hex)
  sum = 0
  hsh = create_hex_hash
  size = hex.chars.size - 1
  hex.upcase.chars.reverse.each_with_index do |h, i|
    if i == 0
      sum += hsh[h]
    else
      sum += hsh[h] * (16 ** i)
    end
  end
  sum
end
