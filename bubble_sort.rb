def bubble_sort!(arr)
  (arr.size - 1).times do
    arr.each_with_index do |e, i|
      break if i > arr.size - 2
      if e > arr[i+1]
          arr[i], arr[i+1] = arr[i+1], arr[i]
        end
      end
    end
  arr
end

def sum_square_difference(num)
  arr = (1..num).to_a
  arr.sum ** 2 - arr.reduce {|mem, e| mem + e**2 }
end
