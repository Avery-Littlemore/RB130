def meth(arr)
  yield(arr)
end

arr = %w(raven finch hawk eagle)

meth(arr) do |birds| 
  _, _, *raptors = birds 
  p raptors
end

meth(arr) do |_, _, *raptors|  
  p raptors
end
