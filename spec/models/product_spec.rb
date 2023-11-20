require_relative '../../models/product'

RSpec.describe Product do
  describe '#exempt?' do
    let(:product) { Product.new(1, name, 10.00) }

    context 'when product is books, food or medical products' do
      let(:name) { 'little red book' }

      it 'returns true' do
        expect(product.exempt?).to eq true
      end
    end

    context 'when product is not books, food or medical products' do
      let(:name) { 'toy' }

      it 'returns true' do
        expect(product.exempt?).to eq false
      end
    end
  end

  describe '#imported?' do
    let(:product) { Product.new(1, name, 10.00) }

    context 'when product is imported' do
      let(:name) { 'imported box of chocolates' }

      it 'returns true' do
        expect(product.imported?).to eq true
      end
    end

    context 'when product is not imported' do
      let(:name) { 'chocolates' }

      it 'returns false' do
        expect(product.imported?).to eq false
      end
    end
  end

  describe '#total_tax' do
    context 'when the product is book and not imported' do
      let(:product) { Product.new(1, 'book', 10.00) }

      it 'returns 0 in tax' do
        expect(product.total_tax).to eq 0
      end
    end

    context 'when product is book, food or medical products, but it is imported' do
      let(:product) { Product.new(1, 'imported book', 10.00) }

      it 'returns the 5% import duty' do
        expect(product.total_tax).to eq 0.5
      end
    end

    context 'when product is not book, food or medical products, and it is not imported' do
      let(:product) { Product.new(1, 'bottle of perfume', 10.00) }

      it 'returns the 10% basic sales tax' do
        expect(product.total_tax).to eq 1.0
      end
    end
  end

  describe '#total' do
    context 'when the product is book and not imported' do
      let(:product) { Product.new(1, 'book', 10.00) }

      it 'returns product price' do
        expect(product.total).to eq 10.00
      end
    end

    context 'when product is book, food or medical products, but it is imported' do
      let(:product) { Product.new(1, 'imported book', 10.00) }

      it 'returns the price +  5% import duty' do
        expect(product.total).to eq 10.5
      end
    end

    context 'when product is not book, food or medical products, and it is not imported' do
      let(:product) { Product.new(1, 'bottle of perfume', 10.00) }

      it 'returns the price + 10% basic sales tax' do
        expect(product.total).to eq 11.0
      end
    end
  end
end
