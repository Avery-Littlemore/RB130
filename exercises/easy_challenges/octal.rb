=begin
P:
- Take an integer in octal representation
- Convert octal to decimal representation
- Return deci
  - If rep can't be produced (incorrect nums or letters), return 0

input: str (number)
output: int

E:
233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

A:
- Create class Octal
- Create constructor method with a number string as parameter
  - Validate input number (if str starts with int, to_i will return start of string)
    - nums with digits >= 8 or that include letters should be set to 0
  - Save num to an instance variable
- Create instance method to_decimal
  - create result sum and set to 0
  - iterate through instance variable's nums
    - multiply current num by 8 and add to result sum
  - return result sum

=end

class Octal
  attr_reader :num
  
  def initialize(num)
    @num = validate(num)
  end

  def to_decimal
    result_sum = 0
    oct_place = num.size - 1
    num.chars.each do |digit|
      result_sum += digit.to_i * 8**oct_place
      oct_place -= 1
    end
    result_sum
  end

  private

  def validate(num)
    num =~ /[\D98]/ ? '0' : num
  end
end

# puts Octal.new('123s').num