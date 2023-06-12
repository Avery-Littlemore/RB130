=begin
P:
- Element class
  - Constructor method (value, opt_next_element = nil)
    - current element value
    - Next field which points to the next element in the list
  - datum
    - returns data value of element
  - tail?
    - returns true if it is the last element in a list
    - i.e., nothing is stored in the next field
  - next
    - returns next element in the list. If tail? return nil
- SimpleLinkedList
  - Push ()

=end

class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :elements

  def initialize(elements = [])
    @elements = elements
  end

  def push(datum)
    elements.unshift(elements.empty? ? Element.new(datum) : Element.new(datum, head))
  end

  def empty?
    elements.empty?
  end

  def size
    elements.size
  end

  def peek
    empty? ? nil : head.datum
  end

  def head
    elements.first
  end

  def pop
    elements.shift.datum
  end

  def self.from_a(arr)
    if arr.nil?
      SimpleLinkedList.new
    else
      list = SimpleLinkedList.new
      (arr.size - 1).downto(0) do |index|
        list.push(arr[index])
      end
      list
    end
  end

  def to_a
    elements.map(&:datum)
  end

  def reverse
    reversed_list = SimpleLinkedList.new
    elements.each do |element|
      reversed_list.push(element.datum)
    end
    reversed_list
  end
end

data = (1..10).to_a
list = SimpleLinkedList.from_a(data)
p data.reverse
p list.reverse.to_a