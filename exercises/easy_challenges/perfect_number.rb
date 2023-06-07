=begin
P:
- Take an integer
- Determine its aliquot sum
- Determine which type of number it is

input: int
output: string (which type of number)

Definitions:
- Aliquot sum: sum of all positive divisors of the original number
- Abundant: Aliquot sum greater than the orig
- Perfect: Aliquot sum that is equal to the orig
- Deficient: Aliquot sum that is less than the orig

E:
6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

A:
- Create class PerfectNumber
- Create class method classify which takes one int as argument
  - throws StandardError if int < 1
  - Evaluate aliquot sum
  - compare aliquot sum and int passed and determine type

=end
class PerfectNumber
  def self.classify(int)
    raise StandardError.new "Number must be greater than 1" if int < 1
    return 'abundant' if aliquot_sum(int) > int
    return 'perfect' if aliquot_sum(int) == int
    return 'deficient' if aliquot_sum(int) < int
  end

  class << self
    private

    def aliquot_sum(int)
      pos_divisors = []
      1.upto(int / 2) do |current_num|
        pos_divisors << current_num if int % current_num == 0
      end
      pos_divisors.sum
    end
  end
end