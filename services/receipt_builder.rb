# frozen_string_literal: true

require_relative '../models/product'
require_relative '../models/receipt'
require_relative './csv_reader'

# ReceiptBuilder is responsible for constructing a Receipt object from a CSV file
# containing product information
class ReceiptBuilder
  def self.build(file_path)
    products = CsvReader.read(file_path)

    receipt = Receipt.new

    products.each do |product|
      receipt.add_product(product)
    end

    receipt.calculate_totals

    receipt
  end
end
