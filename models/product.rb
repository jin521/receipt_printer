# frozen_string_literal: true

# Represents a product with quantity, name, and price.
class Product
  attr_accessor :quantity, :name, :price

  BASIC_SALES_TAX = 0.1
  IMPORT_DUTY_TAX = 0.05

  IMPORTED_KEYWORDS = %w[imported import].freeze
  EXEMPT_KEYWORDS = %w[book books food medical pills chocolate chocolates].freeze

  def initialize(quantity, name, price)
    @quantity = quantity
    @name = name
    @price = price
  end

  def total_tax
    basic_tax_rate = exempt? ? 0 : BASIC_SALES_TAX * 100
    import_duty_tax_rate = imported? ? IMPORT_DUTY_TAX * 100 : 0

    tax_rate = basic_tax_rate + import_duty_tax_rate

    rounding(tax_rate, price)
  end

  def total
    total = price + total_tax
    format('%.2f', total).to_f
  end

  def exempt?
    EXEMPT_KEYWORDS.any? { |keyword| name.include?(keyword) }
  end

  def imported?
    IMPORTED_KEYWORDS.any? { |keyword| name.include?(keyword) }
  end

  private

  def rounding(tax_rate, shelf_price)
    raw_tax = (tax_rate * shelf_price) / 100
    rounded_tax = (raw_tax * 20.0).ceil / 20.0

    format('%.2f', rounded_tax).to_f
  end
end
