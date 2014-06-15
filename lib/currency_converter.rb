class UnknownCurrencyCodeError < StandardError
end

class CurrencyConverter
  attr_reader :conversions

  def initialize(conversions = { USD: 1.0, EUR: 0.74 })
    @conversions = conversions
  end

  def convert(currency, new_code)
    if @conversions.has_key? new_code
      unless currency.code == new_code
        currency.amount *= (1 / @conversions[currency.code])
        currency * @conversions[new_code]
      end
      currency.code = new_code
      currency
    else
      raise UnknownCurrencyCodeError
    end
  end
end
