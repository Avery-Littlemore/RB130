=begin
P: 
- Take a string as input for DNA object
- Compare DNA string with comparison string
- Output number of differences between chars in the strings

Input: one string for initialized object, one string as argument for comparison
Output: integer (number of differences)

Rules: 
- Iterate through each char one by one and compare equality
- When original string is longer, comparison still evaluates
  - Does not mutate original string
Implicit:
  - All chars will be capital

D:
input strings, output int

A: 
- Create a class DNA
- Create constructor method with one string parameter
  - Save DNA object string as @strand
- Create an instance method hamming_distance which takes one string argument
  - Set distance = 0
  - Set counter = 0
  - Iterate through each character in the original string and compare with each character in the comparison string
    - Increase distance every time there is a difference
    - Increase counter by 1 for indexing
  - Return distance
=end

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    distance = 0
    counter = 0
    break_condition = other_strand.size
    @strand.chars do |char|
      distance += 1 if char != other_strand[counter]
      counter += 1
      break if break_condition == counter
    end
    distance
  end
end