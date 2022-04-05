# Madlibs Revisited
REPLACEMENTS = {
  adjective: %w(alert bright brave disturbed perfect),
  noun:      %w(bird fish thing elephant star),
  verb:      %w(perished left appeared grown arrived),
  adverb:    %w(easily noisily beautifully mysteriously tremendously)
}

# File.open('sample.txt') do |file|
#   file.each do |line|
#     puts format(line, noun:      NOUNS.sample,
#                       verb:      VERBS.sample,
#                       adjective: ADJECTIVES.sample,
#                       adverb:    ADVERBS.sample)
#   end
# end

template_text = File.read('madlibs_revisited.txt')
mad_text = template_text.gsub(/%{([a-z]*)}/) do |_|
  REPLACEMENTS[$1.to_sym].sample
end
