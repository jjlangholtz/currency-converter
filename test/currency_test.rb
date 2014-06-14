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

  def test_currencies_can_be_added_with_equal_codes
    usd_one = @currency
    usd_two = Currency.new(15, :USD)
    euro = Currency.new(15, :EUR)

    assert_equal 25, usd_one + usd_two
    assert_raises(TypeError) { usd_one + euro }
  end
end
