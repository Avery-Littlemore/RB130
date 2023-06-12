=begin
P:
- Generate random robot name when first booted or reset
- Generated name cannot be in use
- Form of LETTER-LETTER-num-num-num

Input: none
Output: random name string

E:
RX837
BC811


A:


=end

class Robot
  LETTERS = ('A'..'Z').to_a
  NUMBERS = ('0'..'9').to_a
  @@all_names = []

  attr_reader :name

  def initialize
    assign_name
  end

  def reset
    @@all_names.delete(@name)
    assign_name
  end

  def self.all_names
    @@all_names
  end

  private

  def assign_name
    loop do
      @name = LETTERS.sample + LETTERS.sample + NUMBERS.sample + NUMBERS.sample + NUMBERS.sample
      break unless @@all_names.include? @name
    end
    @@all_names << @name
  end
end

# puts Robot.new.name
# puts Robot.new.name
# b = Robot.new
# a = Robot.new
# p Robot.all_names
# a.reset
# p Robot.all_names
# b.reset
# p Robot.all_names