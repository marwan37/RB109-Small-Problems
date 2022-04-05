def fib(nth)
  return 1 if nth <= 2
  fib(nth - 1) + fib(nth - 2)
end

def fibonacci_tail(nth, acc1, acc2)
  if nth == 1
    acc1
  elsif nth == 2
    acc2
  else
    fibonacci_tail(nth - 1, acc2, acc2 + acc1)
  end
end

def fibonacci(nth)
  fibonacci_tail(nth, 1, 1)
end

FIB_PATTERN = '011235831459437077415617853819099875279651673033695493257291'

def fib_proc(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, (first + last)]
  end
  last
end

def last_phibonacci(nth)
  nth_position = nth % 60
  FIB_PATTERN[nth_position].to_i
end

p fib_proc(12)

# 1 1 2 3 5 8 13 21 34
