STR_INT = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'A' => 11, 'B' => 12, 'C' => 13, 'D' => 14,
  'E' => 15, 'F' => 16
}

def str_to_signed_int(str)
  case str[0]
  when '-' then -s_to_i(str[1..-1])
  when '+' then s_to_i(str[1..-1])
  else          s_to_i(str)
  end
end

def int_to_signed_str(number)
  case number <=> 0
  when -1 then "-#{i_to_s(-number)}"
  when +1 then "+#{i_to_s(number)}"
  else i_to_s(number)
  end
end

def s_to_i(str)
  integer = 0
  multiplier = 1

  for char in str.chars.reverse
    integer += (STR_INT[char] * multiplier)
    multiplier *= 10
  end
  integer
end

def i_to_s(number)
  string = ""
  int_str = STR_INT.invert
  number.digits.each { |n| string.prepend(int_str[n]) }
  string
end


p int_to_signed_str(0)
