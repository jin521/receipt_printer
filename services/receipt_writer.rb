# frozen_string_literal: true

# ReceiptWriter is responsible for generating a formatted string representation
# of a receipt and writing it to an output file.
class ReceiptWriter
  def self.write(receipt, output_file_name)
    result = receipt.products.map { |product| "#{product.quantity}, #{product.name}, #{product.total}" }.join("\n")

    result += "\n"
    result += "\n"
    result += "Sales Taxes: #{receipt.sales_tax}\n"
    result += "Total: #{receipt.total}\n"

    File.write(output_file_name, result)
  end
end
