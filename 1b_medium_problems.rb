def minilang(str)
  arr = %w(PRINT PUSH POP ADD SUB MULT DIV MOD)
  stack = []
  register = 0

  str.split.each do |token|
    break puts register = "Empty stack: can't #{token}" if stack.empty? && arr[2..-1].include?(token)
    case token
    when 'PRINT' then puts register
    when 'PUSH'  then stack << register
    when 'POP'   then register = stack.pop
    when 'ADD'   then register += stack.pop
    when 'SUB'   then register -= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MOD'   then register %= stack.pop
    when /[\d]/  then register = token.to_i
    else         break puts register = "Invalid token"
    end
  end
  register.to_s =~ /[\d]/ ? nil : register
end
# Further exploration (3 + (4 * 5) - 7) / (5 % 3)
# minilang('3 PUSH 5 MOD PUSH 5 PUSH 4 MULT PUSH 3 ADD PUSH -7 ADD DIV PRINT')

DIGITS = {zero: '0', one: '1', two: '2', three: '3', four: '4',
         five: '5', six: '6', seven: '7', eight: '8', nine: '9'}

def word_to_digit(str)
  DIGITS.keys.each { |k| str.gsub!(/#{k}/i, DIGITS[k]) }

  # Further Exploration
  str.gsub!(/(\d)(\s)/, '\1') # => remove space after each digit
  str.gsub!(/(\d)([a-z])/i, '\1 \2') # => add space between last digit and letter (if present)
  str.gsub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
end
