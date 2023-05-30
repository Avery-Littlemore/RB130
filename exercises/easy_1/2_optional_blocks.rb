def compute
  block_given? ? yield : 'Does not compute.'
end

def custom_compute(num)
  block_given? ? yield(num) : "No block given - #{num} is irrelevant"
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

p custom_compute(5) { |num| num + 3 } == 8
p custom_compute(5) { |num| "#{num}" + 'b' } == '5b'
p custom_compute(5) == "No block given - 5 is irrelevant"
