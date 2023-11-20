require_relative '../../services/receipt_builder'
require_relative '../../models/product'

require_relative '../../services/receipt_builder'

RSpec.describe ReceiptBuilder do
  let(:file_path) { 'test.csv' } # Replace with the actual path to your test CSV file

  describe '.build' do
    it 'builds a receipt from CSV file' do
      allow(CSV).to receive(:foreach).with(file_path, headers: true, col_sep: ',').and_yield(
        CSV::Row.new(%w[Quantity Product Price], ['1', 'book', '14.99'])
      ).and_yield(
        CSV::Row.new(%w[Quantity Product Price], ['1', 'music cd', '0.85'])
      )

      receipt_builder = ReceiptBuilder.build(file_path)

      expect(receipt_builder).to be_a(Receipt)
      expect(receipt_builder.products.length).to eq(2)

      product1 = receipt_builder.products[0]
      expect(product1).to be_a(Product)
      expect(product1.quantity).to eq(1)
      expect(product1.name).to eq('book')
      expect(product1.price).to eq(14.99)

      product2 = receipt_builder.products[1]
      expect(product2).to be_a(Product)
      expect(product2.quantity).to eq(1)
      expect(product2.name).to eq('music cd')
      expect(product2.price).to eq(0.85)

      expect(receipt_builder.sales_tax).to_not be_nil
      expect(receipt_builder.total).to_not be_nil
    end
  end
end
