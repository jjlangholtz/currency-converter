require 'minitest/autorun'
require 'currency_converter'

class CurrencyConverterTest < MiniTest::Unit::TestCase
  def setup
    @converter = CurrencyConverter.new
    @usd1 = Currency.new(1, :USD)
    @eur50 = Currency.new(50, :EUR)
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

  def test_can_be_created_with_three_or_more_conversion_rates
    triple_conversion = { USD: 1.0, EUR: 0.74, YEN: 102.02 }
    triple_converter = CurrencyConverter.new(triple_conversion)

    quad_conversion = { USD: 1.0, EUR: 0.74, YEN: 102.02, PES: 13.01 }
    quad_converter = CurrencyConverter.new(quad_conversion)

    assert triple_converter
    assert quad_converter
  end

  def test_converter_can_convert_between_currencies_it_knows
    quad_conversion = { USD: 1.0, EUR: 0.74, YEN: 102.02, PES: 13.01 }
    quad_converter = CurrencyConverter.new(quad_conversion)

    usd_to_yen = quad_converter.convert(@usd1, :YEN)
    assert_equal Currency.new(102.02, :YEN), usd_to_yen

    yen_to_pes = quad_converter.convert(usd_to_yen, :PES)
    assert_equal Currency.new(13.01, :PES), yen_to_pes

    pes_to_eur = quad_converter.convert(yen_to_pes, :EUR)
    assert_equal Currency.new(0.74, :EUR), pes_to_eur
  end
end
