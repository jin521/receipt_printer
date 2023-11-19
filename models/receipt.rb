# frozen_string_literal: true

# Represents a receipt with sales_tax, total, and products.
class Receipt
  attr_accessor :sales_tax, :total, :products

  BASIC_SALES_TAX = 0.1
  IMPORT_DUTY_TAX = 0.05

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
      @sales_tax += product.total_tax
      @total += (product.price + @sales_tax)
    end
  end

  def to_s
    result = ''

    @products.each do |product|
      result += "#{product.quantity}, #{product.name}, #{product.total}\n"
    end

    result += "\n"
    result += "Sales Taxes: #{@sales_tax}\n"
    result += "Total: #{@total}\n"
    result
  end
end

