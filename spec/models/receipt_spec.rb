require_relative '../../models/receipt'
require_relative '../../models/product'

RSpec.describe Receipt do
  describe '#calculate_totals' do
    let(:product1) { Product.new(1, 'book', 12.49) }
    let(:product2) { Product.new(1, 'music cd', 14.99) }
    let(:product3) { Product.new(1, 'chocolate bar', 0.85) }

    let(:receipt) { Receipt.new }

    it 'calculates the totals for the receipt' do
      receipt.add_product(product1)
      receipt.add_product(product2)
      receipt.add_product(product3)

      receipt.calculate_totals

      expect(receipt.sales_tax).to eq 1.5
      expect(receipt.total).to eq 29.83
    end
  end
end