# lear years occur in every year that is evenly divisible by 4 unless the year is also divisilbe by 100
# if it is divisible by 100, then it must also be divisible by 400 (Gregorian Calendar)

# part 2: prior to 1752, leap years were any year that is divisible by 4 (Julian Calendar)

def leap_year?(year)
  div_400, div_4, div_100 = year % 400 == 0, year % 4 == 0, year % 100 == 0
  return div_4 if year < 1752
  div_400 || div_4 && !div_100
end

p leap_year?(2016)
p leap_year?(2015)
p leap_year?(2100)
p leap_year?(2400)
p leap_year?(240000)
p leap_year?(240001)
p leap_year?(2000)
p leap_year?(1900)
p leap_year?(1752)
p leap_year?(1700)
p leap_year?(1)
p leap_year?(100)
p leap_year?(400)
