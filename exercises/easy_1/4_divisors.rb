def divisors(num)
  result = []
  1.upto(num / 2) do |int|
    result << int if num % int == 0
  end
  result << num

  # 1.upto(num).select do |int|
  #   num % int == 0
  # end
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute