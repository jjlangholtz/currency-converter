require 'minitest/autorun'
require 'currency_converter'

class CurrencyConverterTest < MiniTest::Unit::TestCase
  def setup
    @converter = CurrencyConverter.new
  end
  def test_converter_should_have_codes_and_conversion_rates
    assert @converter.conversions
  end

  def test_converter_contains_correct_convertion_rates
    assert_equal 1.0, @converter.conversions[:USD]
    assert_equal 0.74, @converter.conversions[:EUR]
  end

  def test_converter_can_return_currency_object_of_same_code
    assert @converter.convert(Currency.new(1, :USD), :USD) ==
                              Currency.new(1, :USD)
    assert @converter.convert(Currency.new(1, :EUR), :EUR) ==
                              Currency.new(1, :EUR)
  end
end
