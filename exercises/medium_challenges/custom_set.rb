=begin
P:
A set, A, is a subset of another set, B, if all of the elements in A are also in set B.

{ 1, 2, 3 } is a subset of { 2, 4, 3, 1 }
{ 1, 2, 3 } is not a subset of { 1, 2 }
{ 1, 2, 3 } is not a subset of { 1, 2, 4, 5 }

Two sets, A and B, are said to be disjoint if none of the elements in set A are in set B. 
That also implies that none of the elements in B are in A.

{ 1, 2, 3 } and { 4, 5, 6 } are disjoint sets.
{ 1, 2, 3 } and { 4, 3, 6 } are not disjoint

Two sets are said to be equal if both sets contain the exact same elements.

{ 1, 2, 3 } and { 1, 2, 3 } are equal sets.
{ 1, 2, 3 } and { 3, 1, 2 } are also equal sets - the order does not matter.
{ 1, 2, 3 } and { 1, 2 } are not equal sets.
The intersection of two sets, A and B, is a new set that contains all of the elements that are in both A and B. That is, the intersection contains all of the shared elements.

The intersection of { 1, 2, 3 } and { 1, 3, 5 } is { 1, 3 }.
The intersection of { 1, 2, 3 } and { 4, 5, 6 } is the empty set: { }.
The union of two sets, A and B, is a new set that contains all of the elements that are in either A and B (and perhaps both).

The union of { 1, 2, 3 } and { 1, 3, 5 } is { 1, 2, 3, 4, 5 }.
The difference of two sets, A and B, is a new set that contains all of the elements of A that are not present in B.

The difference of { 1, 2, 3 } and { 1, 3, 5 } is { 2 }.
The difference of { 1, 5, 7 } and { 1, 2, 3 } is { 5, 7 }.
The difference of { 1, 2, 3 } and { 4, 5, 6 } is { 1, 2, 3 }.

=end


class CustomSet
  def initialize(arr = [])
    @contents = arr
  end

  def empty?
    contents.empty?
  end

  def contains?(value)
    contents.include? value
  end

  def subset?(other)
    contents.each do |element|
      return false unless other.contents.include?(element)
    end
    true
  end

  def disjoint?(other)
    contents.each do |element|
      return false if other.contents.include?(element)
    end
    true
  end

  def eql?(other)
    contents.uniq.sort == other.contents.uniq.sort
  end

  def add(value)
    contents << value
    self
  end

  def ==(other)
    eql?(other)
  end

  def intersection(other)
    CustomSet.new(contents.select { |element| other.contents.include?(element) })
  end

  def difference(other)
    CustomSet.new(contents.reject { |element| other.contents.include?(element) })
  end

  def union(other)
    CustomSet.new((contents + other.contents).uniq)
  end
  
  protected
  
  attr_reader :contents
end

