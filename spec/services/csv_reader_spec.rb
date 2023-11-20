# spec/csv_reader_spec.rb
require_relative '../../services/csv_reader'
require_relative '../../models/product'

RSpec.describe CsvReader do
  let(:file_path) { 'test.csv' }

  describe '.read' do
    it 'reads CSV rows with different data' do
      allow(CSV).to receive(:foreach).with(file_path, headers: true, col_sep: ',').and_yield(
        CSV::Row.new(%w[Quantity Product Price], ['2', 'music cd', '14.99'])
      ).and_yield(
        CSV::Row.new(%w[Quantity Product Price], ['1', 'chocolate bar', '0.85'])
      )

      products = CsvReader.read(file_path)

      expect(products).to be_an(Array)
      expect(products.length).to eq(2)

      product1 = products[0]
      expect(product1).to be_a(Product)
      expect(product1.quantity).to eq(2)
      expect(product1.name).to eq('music cd')
      expect(product1.price).to eq(14.99)

      product2 = products[1]
      expect(product2).to be_a(Product)
      expect(product2.quantity).to eq(1)
      expect(product2.name).to eq('chocolate bar')
      expect(product2.price).to eq(0.85)
    end
  end
end
