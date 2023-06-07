=begin 
Write a program that, given a natural number and a set of one or more other numbers, can find the sum of all the multiples of the numbers in the set that are less than the first number. If the set of numbers is not given, use a default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

-------------- P 
input: integer and set of numbers, if no sets provided, default to 3 and 5
output: integer - the sum of the multiples



-------------- E 
require 'minitest/autorun'
require_relative 'sum_of_multiples'

class SumTest < Minitest::Test
  def test_sum_to_1
    assert_equal 0, SumOfMultiples.to(1)
  end

  def test_sum_to_3
    skip
    assert_equal 3, SumOfMultiples.to(4) [3]
  end

  def test_sum_to_10
    skip
    assert_equal 23, SumOfMultiples.to(10) [3, 5, 6, 9]
  end
  
  def test_configurable_7_13_17_to_20
    skip
    assert_equal 51, SumOfMultiples.new(7, 13, 17).to(20) [7, 13, 14, 17]
  end
   assert_equal 30, SumOfMultiples.new(4, 6).to(15) [4, 6, 8, 12]


   rules:
  - find the sum of all the unique values of the multiples
  - multiples should be up to but not including the target number
-------------- D
- range of integers
- array
-------------- A 

- create a class called SumOfMultiples
- create a constructor method which should accept a number of integers - but if no values are given, default the values to 3 and 5
  - initialize an instance variable and have it point to the number of given integers 
- create a class method called `to` which should accept one integer
  - create a instance 
  - call to `to` method and pass in the target integer
- create an instance method called `to` which should accept one integer
  - iterate through a range starting from 1 up to but not including the target number
    - iterate through the array of divisors
      - retrieve the integers which are evenly divisible by the current divisor
  - find the unique values and then find the sum of the array




=end 

class SumOfMultiples
  def initialize(*divisors)
    if divisors.empty?
      @divisors = [3,5]
    else
      @divisors = divisors
    end
  end

  def self.to(target_int)
    self.new.to(target_int)
  end

  def to(target_int)
    result = []
    1.upto(target_int - 1) do |current_int|
      @divisors.each do |divisor|
        result << current_int if current_int % divisor == 0
      end
    end
    result.uniq.sum
  end
end