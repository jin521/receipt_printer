# frozen_string_literal: true

# Represents a product with quantity, name, and price.
class Product
  attr_accessor :quantity, :name, :price

  BASIC_SALES_TAX = 0.1
  IMPORT_DUTY_TAX = 0.05

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
    price + total_tax
  end

  def exempt?
    exempt_keywords.any? { |keyword| name.include?(keyword) }
  end

  def imported?
    imported_keywords.any? { |keyword| name.include?(keyword) }
  end

  def to_s
    "Quantity: #{@quantity}, Product: #{@name}, Price: #{@price}"
  end

  private

  def imported_keywords
    %w[imported import]
  end

  def exempt_keywords
    %w[book books food medical pills chocolate chocolates]
  end

  def rounding(tax_rate, shelf_price)
    value = (tax_rate * shelf_price) / 100

    # Round up to the nearest 0.05
    rounded_value = (value * 20.0).ceil / 20.0

    # Ensure the result has two decimal places
    format('%.2f', rounded_value).to_f
  end
end

