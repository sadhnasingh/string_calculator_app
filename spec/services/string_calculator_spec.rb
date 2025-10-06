require 'rails_helper'

RSpec.describe StringCalculator, type: :service do
  describe '#add' do
    it 'returns 0 for empty string' do
      expect(StringCalculator.new.add('')).to eq 0
    end

    it 'returns the number for a single number' do
      expect(StringCalculator.new.add('1')).to eq 1
    end

    it 'adds two comma-separated numbers' do
      expect(StringCalculator.new.add('1,2')).to eq 3
    end
  end
end
