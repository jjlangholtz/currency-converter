class CurrencyConverter
  attr_reader :conversions

  def initialize
    @conversions = { USD: 1.0, EUR: 0.74 }
  end

  def convert(currency, code)
    currency
  end
end
