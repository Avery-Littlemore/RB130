=begin
P:
- Take a string as input
- Take also an array of strings
- Evaluate whether any of the strings in the array are anagrams of the input string
- Return any that are anagrams

input: string & array of strings
output: array (of anagrams)

A:
- Create class Anagram
- Create constructor method with one parameter (string)
  - assign string to instance variable
- Create instance method match with one parameter (array of strings)
  - Create a resuts array
  - iterate through array passed as argument
    - if current word is an anagram for our input string, add current word to results array
  - return results array (empty array if no matches found)

=end

class Anagram
  def initialize(string)
    @input_string = string.downcase
  end

  def match(array_of_strings)
    result = []
    array_of_strings.each do |word|
      if @input_string != word.downcase && @input_string.chars.sort == word.downcase.chars.sort
        result << word
      end
    end
    result
  end
end