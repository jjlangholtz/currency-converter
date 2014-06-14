require 'minitest/autorun'
require 'currency'

class CurrencyTest < MiniTest::Unit::TestCase
  def setup
    @currency = Currency.new(10, :USD)
  end

  def test_currency_should_have_amount
    amount = @currency.amount
    assert amount
  end

  def test_currency_should_have_code
    code = @currency.code
    assert code
  end

  def test_currency_with_same_amount_and_code_are_equal
    currency_one = @currency
    currency_two = Currency.new(10, :USD)
    assert currency_one == currency_two
  end
end
