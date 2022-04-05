def ascii_value(str)
  sum = 0
  str.chars.each { |char| sum += char.ord }
  sum
end

def time_of_day(number)
  hours, minutes = (number.abs).divmod(60)
  hours -= 24 until hours < 24
  if number.negative?
    hours = 24 - hours - (minutes > 0 ? 1 : 0)
    minutes = 60 - minutes
  end
  format('%02d:%02d', hours, minutes)
end

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  minutes = hours * 60 + minutes
  return 0 if minutes - 1440 == 0
  minutes
end

def before_midnight(time_str)
  return 0 if after_midnight(time_str) == 0
  1440 - after_midnight(time_str)
end

def swap(str)
  swapped_str = str.split(" ").map! do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end
  swapped_str.join(" ")
end

def cleanup(str)
  # str.gsub(/[^a-z]+/, " ").squeeze(' ')
  str.gsub(/[^a-zA-Z]+/, " ")
end

def word_sizes(str)
  counts = Hash.new(0)
  trimmed = str.tr("'", "").gsub(/[^a-zA-Z]/, " ")
  trimmed.split.each do |word|
    counts[word.size] += 1
  end
  counts
end
NUMBER_WORDS = %w(zero one two three four five six seven
  eight nine ten eleven twelve thirteen fourteen fifteen
  sixteen seventeen eighteen nineteen)
def alphabetic_number_sort(number_arr)
  # hsh.sort_by(&:last).to_h.keys
  # numbers.sort_by { |number| NUMBER_WORDS[number] }

  hsh = number_arr.map { |i| [i, NUMBER_WORDS[i] ] }.to_h
  new_hsh = Hash.new
  NUMBER_WORDS.sort.each { |num| new_hsh[num] = hsh.key(num) }
  p new_hsh.values
end

def crunch(str)
  # letters = ''
  # str.each_char.with_index do |letter, i|
  #   next if letter == str.chars[i+1]
  #   letters << letter
  # end
  # letters
  str.gsub(/(.)\1+/, '\1')
end

def print_in_box(str)
  size = str.size > 80 ? 80 : (str == "" ? 0 : str.size )
  dotted_line = "+-#{"-"*size}-+"
  empty_line = "| #{" "*size} |"

  st_i = 0
  end_i = 80

  puts dotted_line
  puts empty_line
  puts "| #{str[st_i...end_i]} |"
  while str.size > end_i
      st_i = end_i
      end_i += 80
      spaces = end_i - str.size > 0 ? end_i - str.size : 0
      puts "| #{str[st_i...end_i]} #{" "*spaces}|"
    end
  puts empty_line
  puts dotted_line
end
