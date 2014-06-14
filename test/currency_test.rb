require 'minitest/autorun'
require 'currency'

class CurrencyTest < MiniTest::Unit::TestCase
  def test_currency_should_have_amount
    amount = Currency.new(10, :USD).amount
    assert amount
  end

  def test_currency_should_have_code
    code = Currency.new(10, :USD)
    assert code
  end
end
