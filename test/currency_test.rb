require 'minitest/autorun'
require 'currency'

class CurrencyTest < MiniTest::Unit::TestCase
  def setup
    @usd10 = Currency.new(10, :USD)
    @usd15 = Currency.new(15, :USD)
    @eur15 = Currency.new(15, :EUR)
  end

  def test_currency_should_have_amount
    amount = @usd10.amount
    assert amount
  end

  def test_currency_should_have_code
    code = @usd10.code
    assert code
  end

  def test_currency_with_same_amount_and_code_are_equal
    currency_one = @usd10
    currency_two = Currency.new(10, :USD)
    assert currency_one == currency_two
  end

  def test_currencies_can_be_added_with_equal_codes
    usd_one = @usd10
    usd_two = @usd15
    euro = @eur15

    assert_equal 25, usd_one + usd_two
    assert_raises(TypeError) { usd_one + euro }
  end

  def test_currencies_can_be_subtracted_with_equal_codes
    usd_one = @usd10
    usd_two = @usd15
    euro = @eur15

    assert_equal 5, usd_two - usd_one
    assert_raises(TypeError) { euro - usd_one }
  end

  def test_currencies_can_be_multiped_and_return_a_currency
    usd_one = @usd10
    usd_two = @usd15
    euro = @eur15

    assert_equal Currency.new(100, :USD), usd_one * 10
    assert_equal Currency.new(150.0, :USD), usd_two * 10.0
    assert_equal Currency.new(3, :EUR), euro * 0.2
  end
end
