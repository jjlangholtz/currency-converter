require 'minitest/autorun'
require 'currency_converter'

class CurrencyConverterTest < MiniTest::Unit::TestCase
  def setup
    @converter = CurrencyConverter.new
    @usd1 = Currency.new(1, :USD)
  end

  def test_converter_should_have_codes_and_conversion_rates
    assert @converter.conversions
  end

  def test_converter_contains_correct_convertion_rates
    assert_equal 1.0, @converter.conversions[:USD]
    assert_equal 0.74, @converter.conversions[:EUR]
  end

  def test_converter_can_return_currency_object_of_same_code
    assert @converter.convert(@usd1, :USD) ==
                              Currency.new(1, :USD)
    assert @converter.convert(Currency.new(1, :EUR), :EUR) ==
                              Currency.new(1, :EUR)
  end

  def test_converter_can_convert_between_codes_with_correct_amount
    converted_currency = @converter.convert(@usd1, :EUR)
    assert_equal Currency.new(0.74, :EUR), converted_currency
  end
end
