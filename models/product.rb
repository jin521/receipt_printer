# frozen_string_literal: true

# Represents a product with quantity, name, and price.
class Product
  attr_accessor :quantity, :name, :price

  def initialize(quantity, name, price)
    @quantity = quantity
    @name = name
    @price = price
  end

  def to_s
    "Quantity: #{@quantity}, Product: #{@name}, Price: #{@price}"
  end
end
