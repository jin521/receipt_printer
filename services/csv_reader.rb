# frozen_string_literal: true

require 'csv'

# CsvReader is a utility class for reading CSV files containing product information.
class CsvReader
  def self.read(file_path)
    products = []

    CSV.foreach(file_path, headers: true, col_sep: ',') do |row|
      quantity = row['Quantity'].to_i
      product_name = row['Product'].strip
      price = row['Price'].to_f

      product = Product.new(quantity, product_name, price)
      products << product
    end

    products
  end
end
