class CurrencyConverter
  attr_reader :conversions

  def initialize
    @conversions = { USD: 1.0, EUR: 0.74 }
  end

  def convert(currency, new_code)
    currency * @conversions[new_code] unless currency.code == new_code
    currency.code = new_code
    currency
  end
end
