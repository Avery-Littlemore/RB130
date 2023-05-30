def missing(arr)
  start_int = arr.first
  last_int = arr.last
  result = []
  start_int.upto(last_int) do |int|
    result << int if !arr.include?(int)
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []