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

    it 'adds an unknown amount of numbers' do
      expect(StringCalculator.new.add('1,2,3,4')).to eq 10
    end

    it 'accepts newlines between numbers' do
      expect(StringCalculator.new.add("1\n2,3")).to eq 6
    end

    it 'supports custom delimiter like //;\\n1;2' do
      expect(StringCalculator.new.add("//;\n1;2")).to eq 3
    end

    it 'raises when negatives are present and lists them' do
      expect { StringCalculator.new.add("1,-2,-5") }.to raise_error(ArgumentError, "Negatives not allowed: -2,-5")
    end
  end
end