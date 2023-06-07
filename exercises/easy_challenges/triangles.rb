=begin
P: 
- Assess the input triangle and determine which type of triangle it is
- could be: 
  - equilateral (all sides equal)
  - isosceles (two sides are equal)
  - scalene (no sides are equal)

Input: three ints (one per side)
Output: string (equilateral/isosceles/scalene)

Rules: 
- all sides must be > 0
- sum of lengths of any two sides must be greater than the third side

D:
input integers, output string

A: 
- Create class Triangle
- Create initialize method
  - takes three arguments, one per side
  - validates that triangle is legal per our rules -> call validate triangle method
  - add sides to instance variables
- Create validate instance method
  - Test that all sides are greater than zero
  - Test that the sum of any two sides is greater than the third
    - This can be another method... TBD
- Create kind instance method
  - Based on the prevalidated sides, determine which triangle it is
  - Return triangle type as string

=end

class Triangle
  def initialize(s1, s2, s3)
    raise ArgumentError.new "Invalid triangle lengths" unless valid?(s1, s2, s3)
    @sides = [s1, s2, s3]
  end

  def kind
    return 'equilateral' if @sides.uniq.size == 1
    return 'isosceles' if @sides.uniq.size == 2
    return 'scalene' if @sides.uniq.size == 3
  end

  private

  def valid?(s1, s2, s3)
    greater_than_zero?(s1, s2, s3) && valid_sides?(s1, s2, s3)
  end

  def greater_than_zero?(s1, s2, s3)
    s1 > 0 && s2 > 0 && s3 > 0
  end

  def valid_sides?(s1, s2, s3)
    (s1 + s2 > s3) && (s1 + s3 > s2) && (s2 + s3 > s1)
  end
end