require 'minitest/autorun'
require 'currency_converter'

class CurrencyConverterTest < MiniTest::Unit::TestCase
  def test_converter_should_have_codes_and_conversion_rates
    @converter = CurrencyConverter.new
    assert @converter.conversions
  end
end
