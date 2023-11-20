require_relative '../../services/receipt_printer'
require_relative '../../models/receipt'

RSpec.describe ReceiptPrinter do
  let(:file_path) { 'test.csv' }

  describe '.print' do
    it 'prints the receipt details' do
      product1 = Product.new(1, 'imported box of chocolates', 10.00)
      product2 = Product.new(1, 'imported bottle of perfume', 47.50)

      receipt = Receipt.new
      receipt.add_product(product1)
      receipt.add_product(product2)

      receipt.calculate_totals

      expect { ReceiptPrinter.print(receipt) }.to output(
        "1, imported box of chocolates, 10.5\n1, imported bottle of perfume, 54.65\n\nSales Taxes: 7.65\nTotal: 65.15\n"
      ).to_stdout
    end
  end
end