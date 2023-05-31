def each_with_object(arr, obj)
  # arr.each do |num|
  #   if obj.class == Hash
  #     obj[num] = yield(num, obj)
  #   else
  #     obj = yield(num, obj)
  #   end
  # end
  arr.each { |num| yield(num, obj) }
  obj
end




result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}