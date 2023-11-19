require_relative 'models/product'
require_relative 'models/receipt'
require_relative 'services/csv_reader'

class ReceiptPrinter
  def self.print(file_path)
    products = CsvReader.read(file_path)

    receipt = Receipt.new

    products.each do |product|
      receipt.add_product(product)
    end

    receipt.calculate_totals

    puts receipt.to_s
  end
end

