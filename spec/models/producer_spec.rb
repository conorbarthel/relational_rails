require 'rails_helper'

RSpec.describe Producer, type: :model do
  describe 'relationships' do
    it {should have_many :discs}
  end

  describe 'class methods' do
    xit '#most_recent' do
      expect(Producer.most_recent[0]).to_be > (Producer.most_recent[1])
      expect(Producer.most_recent[-1]).to_be < (Producer.most_recent[0])
    end
  end
end
