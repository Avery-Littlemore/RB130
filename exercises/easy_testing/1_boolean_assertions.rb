# Write a minitest assertion that will fail if the value.odd? is not true.

def test_odd
  value = 5
  assert_equal(true, value.odd?)
  # assert value.odd?, 'value is not odd' # Most (but not all) of the minitest assertions let you specify a failure message as the final argument.
end