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
end
