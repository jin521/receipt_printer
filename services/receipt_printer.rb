# frozen_string_literal: true

require_relative '../models/product'
require_relative '../models/receipt'
require_relative './csv_reader'

# ReceiptPrinter is responsible for generating a formatted string representation of a receipt.
class ReceiptPrinter
  def self.print(receipt)
    result = receipt.products.map { |product| "#{product.quantity}, #{product.name}, #{product.total}" }.join("\n")

    result += "\n"
    result += "\n"
    result += "Sales Taxes: #{receipt.sales_tax}\n"
    result += "Total: #{receipt.total}\n"

    puts result
  end
end
