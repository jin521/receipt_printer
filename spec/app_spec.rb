require_relative '../app'

RSpec.describe ReceiptPrinter do
  describe '.print' do
    it 'returns a greeting message' do
      expect(ReceiptPrinter.print).to eq('Hello, Ruby!')
    end
  end
end