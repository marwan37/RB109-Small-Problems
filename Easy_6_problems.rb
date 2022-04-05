DEGREE = "\xC2\xB0"

def dms(number)
  number -= 360 while number > 360
  number += 360 while number < 0

  degrees = number.to_i
  minutes = (number % 1).round(5) * 60
  seconds = (minutes % 1).round(5) * 60

  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

def remove_vowels(arr)
  arr.map do |str|
    str.gsub(/[aeiou]/i, '')
  end
end

def find_fibonacci_index_by_length(n)
  fib = [1, 1]
  i = 2

  until fib[-1] / 10**(n-1) > 0
    fib.push(fib.shift + fib[-1])
    p fib
    i +=1
  end
  i
end

def reverse!(arr)
  arr.size.times { |i| arr.insert(i, arr.pop) }
  arr
end

def reverse(arr)
  temp_arr = []
  arr.size.times { |i| temp_arr << arr[-1 - i] }
  temp_arr
end

def merge(arr_1, arr_2)
 arr1 | arr2
end

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end

def find_dup(arr)
  arr.find { |e| arr.count(e) == 2 }
end

def include?(arr, value)
  arr.find { |e| return true if e == value }
  false
  # easy way
  # !!array.find_index(value)
end

# input: + integer (n)
# output: right triangle whose sides each have n stars

def triangle(n)
  n.times do |i|
    puts " "*(n-i-1) + "*"*(i+1)
  end
end
