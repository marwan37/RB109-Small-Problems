# - input: Array
# - output: return each the value of each odd index of that array
def oddities(arr)
  arr.select.with_index { |_, idx| idx.even? }
end

string = "Madam, I'm Adam34"
# remove all non alphanumeric characters including spaces
string.downcase.gsub(/[^a-z0-9]/i, '')
# or
string.downcase.delete('^a-z0-9')

#keep whitespaces
string.downcase.gsub(/[^a-z0-9\s]/i, '')
#or
string.downcase.gsub(/[^a-z0-9 ]/i, '')


#input: year
#output:
# 4-9 -> th
# 1 -> 1st
# 2 -> 2nd
# 3 -> 3rd

# 10101 - 102 - 102nd
# lastchar is not < 10 -> 102

# def century(year)
#   century = year / 100 + 1
#   century -= 1 if year % 100 == 0
#   century.to_s + century_suffix(century)
# end

# def century_suffix(century)
#   return 'th' if [11, 12, 13].include?(century % 100)
#   last_digit = century % 10

#   case last_digit
#   when 1 then 'st'
#   when 2 then 'nd'
#   when 3 then 'rd'
#   else 'th'
#   end
# end

def century(year)
  year += 99
  puts year
  year = year.to_s
  year.slice!(-2..-1)
  puts year
  if year[-2] != '1'
    case year[-1]
    when '1'
      year + "st"
    when '2'
      year + "nd"
    when '3'
      year + "rd"
    else
      year + "th"
    end
  else
    year + "th"
  end
end

p century(210122)
