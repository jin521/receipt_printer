require_relative '../../services/receipt_writer'
require_relative '../../models/product'
require_relative '../../models/receipt'

require 'tempfile'

RSpec.describe ReceiptWriter do
  describe '.write' do
    it 'writes the receipt details to csv' do
      product1 = Product.new(1, 'imported box of chocolates', 10.00)
      product2 = Product.new(1, 'imported bottle of perfume', 47.50)

      receipt = Receipt.new
      receipt.add_product(product1)
      receipt.add_product(product2)

      receipt.calculate_totals

      Tempfile.open(['output', '.csv']) do |tempfile|
        output_file_name = tempfile.path

        ReceiptWriter.write(receipt, output_file_name)

        expect(File.read(output_file_name)).to eq("1, imported box of chocolates, 10.5\n1, imported bottle of perfume, 54.65")
      end
    end
  end
end