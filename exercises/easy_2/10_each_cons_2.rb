=begin
P
- Accept an array
- Accept a num of elements to process
  - When ETP = 1
    - only pass current element as argument
    - break after every element has been passed
  - When ETP = 2
    - passes current element and next element in the array
    - break when the next element in the array returns nil (i.e., run out of elements)
  - When ETP = 3
    - passes current element and next two elements in the array
    - break when the furthest element in the array returns nil (i.e., run out of elements)

Input: array, number of elements to process
Output: nil

=end


def each_cons(arr, elements_to_process)
  arr.each_with_index do |el, idx|
    break if idx + elements_to_process - 1 >= arr.size
    yield(*arr[idx..(idx + elements_to_process - 1)])
    # p *arr[idx..(idx + elements_to_process - 1)]
    # p arr[idx..(idx + elements_to_process - 1)]
    
    # case elements_to_process
    # when 1 then yield(el)
    # when 2 then yield(el, arr[idx + 1])
    # when 3 then yield(el, arr[idx + 1], arr[idx + 2])
    # when 4 then yield(el, arr[idx + 1], arr[idx + 2], arr[idx + 3])
    # end
  end  
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}