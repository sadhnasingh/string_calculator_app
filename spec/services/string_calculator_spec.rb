require 'rails_helper'

RSpec.describe StringCalculator, type: :service do
  describe '#add' do
    it 'returns 0 for empty string' do
      expect(StringCalculator.new.add('')).to eq 0
    end
  end
end
