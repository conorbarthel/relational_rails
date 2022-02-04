require 'rails_helper'

RSpec.describe Producer, type: :model do
  describe 'relationships' do
    it {should have_many :discs}
  end

  describe 'class methods' do
    it 'count' do
      innova = Producer.create!(name:'Innova', number_of_athletes: 56, free_shipping: true)

      expect(innova.count).to eq(0)

      innova.discs.create!(name: 'Leopard', plastic: 'DX', speed: 6, available: true)
      innova.discs.create!(name: 'Destroyer', plastic: 'Star', speed: 12, available: true)
      innova.discs.create!(name: 'Rhyno', plastic: 'R-Pro', speed: 2, available: false)

      expect(innova.count).to eq(3)
    end
  end
end
