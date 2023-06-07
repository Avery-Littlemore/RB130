=begin
P: 
- Take a number as input
- Return that integer in roman numeral representation
I = 1
V = 5
X = 10
L = 50
C = 100
D = 500
M = 1000

Input: int
Output: string (roman numeral representation of int)

Rules: 
- Assess each digit separately from left to right

E: 
1 => I
2 => II
3 => III
4 => IV
5 => V
6 => VI
9 => IX
27 => XXVII
48 => XLVIII
59 => LIX
93 => XCIII
141 => CXLI
163 => CLXIII
402 => CDII
575 => DLXXV
911 => CMXI
1024 => MXXIV
3000 => MMM

if 4 or 9, need special treatment

D:
input integers, output string

A: 
- Create class RomanNumeral
- Create constructor method with one parameter (int)
  - Assign int to instance variable
- Create instance method to_roman
  - evaluate num and convert

=end

class RomanNumeral
  NUMERAL_CONVERSION = [[1000, 'M'], [900, 'CM'], [500, 'D'], [400, 'CD'], [100, 'C'], [90, 'XC'], [50, 'L'], [40, 'XL'], [10, 'X'], [9, 'IX'], [5, 'V'], [4, 'IV'], [1, 'I']].freeze

  def initialize(num)
    @number = num
  end

  def to_roman
    roman_version = ''
    to_convert = @number.clone
    NUMERAL_CONVERSION.each do |pair|
      multiplier, remainder = to_convert.divmod(pair[0])
      if multiplier > 0
        roman_version << (pair[1] * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end
end

p RomanNumeral.new(48).to_roman