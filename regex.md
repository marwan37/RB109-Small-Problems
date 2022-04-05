# ANY character
/./

# Whitespace characters || Non-whitespace characters
/\s/
/\S/

# any lowercase alphabet or whitespace characters
/[a-z\s]/

# any alphanumeric character regardless of case (yYnN)
/[0-9a-z]/i

# any decimal digit (0-9) || any character but a decimal digit
/\d/
/\D/

# any hexadecimal digit (0-9, A-F, a-f) || any character but a hexadecimal digit 
/\h/
/\H/

# any character but the specified character (^)
/[^xyz]/

# any word characters || non-word characters
/\w/
/\W/
*note: \w matches digits and underscores as well.*
*note: \W matches all special characters, including whitespaces*

# any words delimited by whitespace characters
/\s...\s/  ` abc `
/\s..\s/  ` ab `
*the number of dots represents the number of letters*

**ANCHORS**
# /^/ -> all lines (not strings) that begin with argument passed
# /$/ -> all lines (not strings) that end with argument passed
# /\A/ -> ensures regex match beginning of string (not lines)
# /\z/ -> ensures regex match ending of string (not lines)

**BOUNDARIES**
# \b\w\w\w\b -> matches 3 letter words

**QUANTIFIERS**
# replaces all repeated letters in a string by one letter only
`str.gsub(/(.)\1+/, '\1')`
'ddaaiillyy ddoouubbllee') #=> "daily double"
'4444abcabccba') #=> "4abcabcba"
'ggggggggggggggg') #=> "g"
'a' #=> "a"
'' #=>  ""

# doubles each character in a string
`str.gsub(/(.)/, '\1\1')`
'Hello' == "Hheelllloo"


# matches all digits that are 3 or more digits long
`/\b\d\d\d+\b/`
`/\b\d\d\d\d*\b/`

# matches any sequence of characters that begins with `blu`, ends with `doc`,
# and contains any number of `e`s between the beginning and end.
`/blue*doc/`

# optional character `?`, for example `/coo?t/` matches `c`, `o`, optional `o`, `t`
S`cot`t s`coot`s but doesn't act cooot.

# `/\b\d\d\d\d-?\d\d-?\d\d\b/` matches all 4 dates below:
20170111 | 2017-01-11 | 2017-0111 | 201701-11

# `/\b\d{10}\b/` matches ten consecutive digits (US-style phone number)
`2225551212` | `1234567890` | 123456789 | 12345678900

# `\b\d{3,}\b` matches numbers that are at least three digits in length (3+)

# `/\b[a-z]{5,8}\b/i` matches words of 5-8 letters

*EXAMPLES*
Matches 4-digit hexadecimal chars delimited by whitespaces
# \s\h\h\h\h\s

# /^cat/
  `cat`  | `cat`astrophe | wildcat | I love my cat | <cat>

# /cat$/
  `cat` | catastrophe | wild`cat` | I love my `cat` | <cat>

# \A \z
1. "red fish\nblue fish"
2. "red fish\nred shirt"
# `/\Ablue/` -> matches first text
# `/\Ared/` 
# `/fish\z/`
# `/shirt\z/` -> matches second text

# /^The\b/
`The` lazy cat sleeps.
`The` number 623 is not a word.
Then, we went to the movies.
Ah. The bus has arrived.

# /\bcat$/
The lazy cat sleeps | The number 623 is not a `cat` | The Alaskan drives a snowcat

# /^(A|The) [a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z] (dog|cat)$/
# /\A(A|The) [a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z] (dog|cat)\z/ *proper ruby solution*
`A grey cat` | A blue caterpillar | `The lazy dog` | The white cat | `A loud dog` 
--A loud dog | Go away dog | The ugly rat | The lazy, loud dog

