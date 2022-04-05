def star(n)
  a, b, c = [-1, n, n/2]
  stars = (1..c).map { |_| a += 1; b -= 1; [a, n/2, b] }
  spaces = (1..c).map.with_index do |row, i|
    (0..n-1).map { |x| x if !stars[i].include?(x) }
  end
  spaces.each { |row| row.map! { |e| e.nil? ? "*" : " " }.join }
  spaces.each { |row| puts row.join }; puts "*"*n
  spaces.reverse_each { |row| puts row.join }
end

# def transpose(mtx)
#   columns = (1..mtx[0].size).map {|_| []}
#   columns.map.with_index do |_, i|
#       (0...mtx.size).map do |row|
#         mtx[row][i]
#     end
#   end
#   columns
# end

def transpose(matrix)
  first_row, *other_rows = matrix
  p first_row; p other_rows
  first_row.zip(*other_rows)
end


# transpose([[1, 2, 3 ,4]])
# transpose([[1], [2], [3], [4]])
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]])
# p transpose([[1]])

# [[1, 2, 3 ,4]] <-> [[1], [2], [3], [4]]

# if first_arr_el_count = 4, and num_of_rows = 1, return 4 columns with 1 element
# if 1 element in 1st array, and num of rows is 4. return 1 array with 4 elements
# if 5 elements in 1st array, and num rows is 3. return 5 arrays with 3 elements
