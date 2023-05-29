[1, 2, 3].reduce do |acc, num|
  acc + num
end

# => 6

def reduce(array, start_value = 0)
  if start_value == 0
    accumulator = array[0]
    counter = 1
  else
    accumulator = start_value
    counter = 0
  end
  
  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end
  accumulator
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']