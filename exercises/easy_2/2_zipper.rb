# emulate [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

def zip(arr1, arr2)
  result = []
  arr1.each_with_index do |_, idx|
    result << [arr1[idx], arr2[idx]]
  end
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]