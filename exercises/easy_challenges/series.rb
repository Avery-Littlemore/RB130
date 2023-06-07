=begin
P:
- Take a string of digits
- Take an int describing number of consecutive numbers
- Return all possible consecutive number series from the inputs
  - value of nums irrelevant

input: string number
output: array with subarray of ints

A:
- Create class Series
- Create constructor method with int string as parameter
  - Save to instance var
- Create instance method slices with one parameter (slice_size)
  - Create empty result array
  - Iterate through characters -> iterate from 0 to string size - slice_size
    - Create a new array from current char (to_i) to the char at current index + argument slice_size. Use array.slice(current_index, slice_size)
    - Insert array into result array using <<
  - return result array

=end

class Series
  attr_reader :int_string

  def initialize(int_string)
    @int_string = int_string
  end

  def slices(slice_size)
    raise ArgumentError.new if slice_size > int_string.size
    result = []
    0.upto(int_string.size - slice_size) do |current_index|
      consecutive_nums = int_string.slice(current_index, slice_size)
      result << consecutive_nums.chars.map(&:to_i)
    end
    result
  end
end


p Series.new('01234').slices(1)