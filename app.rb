# app.rb
class ReceiptPrinter
  def self.print(file_path)
    products = CsvReader.read(file_path)

    receipt = Receipt.new

    products.each do |product|
      receipt.add_product(product)
    end

    receipt.calculate_totals

    puts receipt.to_s

    receipt
  end
end
