require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(1_000_000)
    @transaction = Transaction.new(50)
    @transaction.amount_paid = 100
  end

  def test_accept_money
    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    current_amount = @register.total_money

    assert_equal(previous_amount + 100, current_amount)
  end

  def test_change
    current_paid = @transaction.amount_paid
    total_cost = @transaction.item_cost
    assert_equal(50, @register.change(@transaction))
  end

  def test_give_receipt
    cost = @transaction.item_cost
    assert_output("You've paid $#{cost}.\n") { @register.give_receipt(@transaction) }
  end

  def test_prompt_for_payment
    input = StringIO.new("50\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert(50, @transaction.amount_paid)
  end

end