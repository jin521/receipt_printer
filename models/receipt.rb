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
    @products.each do |product|
      product_tax = (product.price * 0.1).round(2)
      @sales_tax += product_tax
      @total += (product.price + product_tax)
    end
  end

  def to_s
    result = ''
    @products.each do |product|
      result += "#{product.quantity}, #{product.name}, #{'%.2f' % (product.price + calculate_tax(product.price))}\n"
    end

    result += "\n"
    result += "Sales Taxes: #{'%.2f' % @sales_tax}\n"
    result += "Total: #{'%.2f' % @total}\n"
    result
  end

  private

  def calculate_tax(price)
    # For simplicity, a flat 10% sales tax on all products
    (price * 0.1).round(2)
  end
end

