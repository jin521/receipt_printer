# frozen_string_literal: true

# Represents a receipt with sales_tax, total, and products.
class Receipt
  attr_accessor :sales_tax, :total, :products

  def initialize
    @sales_tax = 0
    @total = 0
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def calculate_totals
    @sales_tax = @products.sum { |product| product.total_tax }
    @total = @products.sum { |product| product.total }

    @sales_tax = format('%.2f', @sales_tax).to_f
    @total = format('%.2f', @total).to_f
  end
end
