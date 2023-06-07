=begin
P:
- Take a string as input
- case insensitive
- whitespace chars irrelevant to score, nil returns 0
- evaluate score and return int

input: string (or nil)
output: int

A, E, I, O, U, L, N, R, S, T => 1
D, G => 2
B, C, M, P => 3
F, H, V, W, Y => 4
K => 5
J, X => 8
Q, Z => 10

A:
- Create class Scrabble
- Create constant to hold all of the values
- Create constructor method with one parameter (string)
  - assign lowercased string to instance variable (avoid case matching issues)
- Create instance method #score with no parameters
  - validate letters only
  - create a result sum variable and set to 0
  - iterate through each char of input string
    - find char's value by comparing with the constant
    - add char's value to result sum
  - return result sum
- Create class method ::score with one string parameter 
  - Create a new instance of Scrabble with argument (parameter) and invoke instance variable score

# - create a result sum variable and set to 0
#   - iterate through each char of input string
#     - NOTE Char here needs to be downcased 
#     - find char's value by comparing with the constant
#     - add char's value to result sum
#   - return result sum
=end

class Scrabble
  LETTERS = [[%w(a e i o u l n r s t), 1], [%w(d g), 2], [%w(b c m p), 3], [%w(f h v w y), 4], [%w(k), 5], [%w(j x), 8], [%w(q z), 10]].freeze
  attr_reader :word

  def initialize(word)
    @word = word ? word.downcase : ''
  end

  def score
    return 0 if word.nil?

    letters_only = word.gsub(/\s/, '')
    result_sum = 0
    letters_only.chars.each do |char|
      LETTERS.each do |letter_value_pair|
        if letter_value_pair[0].include?(char)
          result_sum += letter_value_pair[1]
        end
      end
    end
    result_sum
  end

  def self.score(word)
    self.new(word).score
  end
end