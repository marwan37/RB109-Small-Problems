# // 20 questions -> 3 hours
# 8 mins / question
# go through study guide written by other students / LS

# make sure you answer every part of the question


# review substrings

## Interview assessment
# explain your thought process while coding
# I need one mintue to think about the problem

# input : array of n positive integers
# input 2: positive integer s

# Given an array of n positive integers and a positive integer s,
# find the minimal length of a contiguous subarray of which the sum ≥ s.
# If there isn't one, return 0 instead.

# p minSubLength([2,3,1,2,4,3], 7) == 2
# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p minSubLength([1, 2, 4], 8) == 0

# - input: array , number
# - divide array into all subsequences
# - add each subsequence individually
# - add subsequence to new array if sum >= number
# - return smallest subsequence size

def get_subsequences(arr)
  result = []
  starting_index = 0;

  while (starting_index <= arr.size - 1)
    num_el = 1
    while (num_el <= arr.size - starting_index)
      subseq = arr[starting_index, num_el]
      result << subseq
      num_el += 1
    end
    starting_index += 1
  end
  result
end

def minSubLength(arr, s)
  new_arr = []
  result = get_subsequences(arr)
  result.each do |subseq|
    sum = subseq.reduce(:+)
    new_arr << subseq.size if sum >= s
  end
  new_arr.empty? ? 0 : new_arr.min
end

arr = [1,2,3,4,5]
p arr[4, 1]
# p get_subsequences(arr)
