BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze
def block_word?(word)
  letters = word.upcase
  BLOCKS.none? do |block|
    letters.count(block) >= 2
  end
end

def letter_percentages(str)
  {
    lowercase: str.count('a-z') / str.size.to_f * 100,
    uppercase: str.count('A-Z') / str.size.to_f * 100,
    neither: str.count('^a-zA-Z') / str.size.to_f * 100
  }
end

def balance?(str)
  b = [[0],[0]]
  isolated = str.chars.select { |e| e.count('()') > 0 }
  isolated.each_with_index do |e,i|
    e == '(' ? b[0] << i : b[1] << i
  end
  str.count('(') == str.count(')') && b[0].max <= b[1].max ? true : false
end

PAIRS = {
  '(' => ')',
  '[' => ']',
  '{' => '}',
  '“' => '”',
  "‘" => "’"
}

def balanced?(string)
  left, right = [], []
  pairs = [ ['(', ')', 0], ['[', ']', 0], ['{', '}', 0],
          ['“', '”', 0], ["‘", "’", 0]
  ]

  pairs.each_with_index do |pair, i|
    string.each_char do |char|
      left << char if PAIRS.keys.include?(char)
      right << char if PAIRS.values.include?(char)
      case char
      when pair[0] then pair[2] += 1 if pair[2] >= 0
      when pair[1] then pair[2] -= 1
      end
    end
  end

  balance = pairs.flatten.select { |e| e.is_a? Numeric }

  if left.size == right.size && balance.none? { |n| n != 0 || n.odd? }
      equilibrium = left.reverse_each.with_index.all? do |l, i|
        left.reverse.find_index(l) == right.find_index(PAIRS[l])
    end
  end

  equilibrium == true
end

def triangle(s1, s2, s3)
  sides = [s1, s2, s3]
  return :invalid if sides.include?(0) || 2*sides.max > sides.sum
  return :equilateral if s1 == s2 && s2 == s3
  return :isosceles if s1 == s2 || s2 == s3 || s1 == s3
  :scalene
end

def tri_angle(a1, a2, a3)
  angles = [a1, a2, a3]
  return :invalid if angles.include?(0) || angles.sum != 180
  return :acute if angles.all? { |a| a < 90 }
  return :obtuse if angles.any? { |a| a > 90 }
  :right
end

require 'date'

def friday_13th(year)
  count = 0
  1.upto(12) do |month|
    d = Date.new(year, month, 13)
    count += 1 if d.friday?
  end
  count
end

def five_fridays(year)
  fivers = []
  1.upto(12) do |month|
    count = 0
    days = Date.new(year, month, -1).day

    1.upto(days) do |day|
      d = Date.new(year, month, day)
      count += 1 if d.friday?
      break fivers << month if count > 4
    end
  end
  fivers
end

def fridays(year)
  # => Date.new(year).step(Date.new(year, -1, -1)).count = 365days
  Date.new(year).step(Date.new(year, -1, -1))
    .select(&:friday?)
    .group_by(&:month)
    .select { |_, fridays| fridays.size > 4 }
    .keys
end

# featured number
# odd number, multiple of 7
# digits occur exactly once each


#input: single integer, R => next featured number that is > argument
# if no next featured number found, return an error

def featured(num)
  return nil if num.digits.size > 9
  num += 1
  num += 1 until num.odd? && num % 7 == 0
  loop do
    break if num.digits.uniq == num.digits && num.odd?
    num += 14
    break if num >= 9_876_543_210
  end
  num
end

p featured(999_999_987)

# featured number
# odd number, multiple of 7
# digits occur exactly once each
# 49 is featured, 98 (not odd) is not

#input: single integer, R => next featured number that is > argument
# if no next featured number found, return an error
