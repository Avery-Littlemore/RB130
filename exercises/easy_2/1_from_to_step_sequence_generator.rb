def step(start_int, end_int, iterator)
  current_int = start_int
  until current_int > end_int
    yield(current_int)
    current_int += iterator
  end
  current_int
end

step(1, 10, 3) { |value| puts "value = #{value}" }