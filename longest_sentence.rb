
# content = File.read('gettysburg.rtf')


content = File.read('pg84.txt')
content.gsub!(/[.?!]/, '\0|')
sentences = content.split(/\|/)
longest_sentence = sentences.max_by { |sentence| sentence.split.size }
longest_sentence.strip!.gsub!(/\n/, ' ').gsub!(/\r|\\/, '')

puts "#{longest_sentence}"
puts "Longest sentence: #{longest_sentence.split.size} words"



# sentence = ''
# longest = 0
# longest_sentence = ''

# File.foreach("pg84.txt") do |line|
#   sentence << line if line !=~ /\S(\.|\?|!)/
#   if line =~ /\S(\.|\?|\!)/
#     sentence.gsub!(/(\.)(.)+/, '\1')
#     if sentence.split.size > longest
#       longest = sentence.split.size
#       longest_sentence = sentence
#     end
#     sentence = line.gsub(/.+\. /, '')
#   end
#   longest_sentence.gsub!(/\\/, '')
#   longest_sentence.gsub!(/\n|\r/, ' ')
# end

# File.foreach("gettysburg.rtf") do |line|
# sentence << line if line !=~ /\S(\.|\?|!)/
#   if line =~ /\S(\.|\?|\!)/
#     sentence.gsub!(/(\.)(.)+/, '\1')
#     if sentence.split.size > longest
#       longest = sentence.split.size
#       longest_sentence = sentence
#     end
#     sentence = line.gsub(/.+\. /, '')
#   end
#   longest_sentence.gsub!(/\\/, '')
#   longest_sentence.gsub!(/\n|\r/, ' ')
# end

# puts longest_sentence
# puts longest
