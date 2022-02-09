require 'rails_helper'

RSpec.describe Producer, type: :model do
  describe 'relationships' do
    it {should have_many :discs}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :number_of_athletes}
    it {should allow_value(true).for(:free_shipping)}
    it {should allow_value(false).for(:free_shipping)}
  end

  describe 'class methods' do
    it '#count' do
      innova = Producer.create!(name:'Innova', number_of_athletes: 56, free_shipping: true)

      expect(innova.count).to eq(0)

      innova.discs.create!(name: 'Leopard', plastic: 'DX', speed: 6, available: true)
      innova.discs.create!(name: 'Destroyer', plastic: 'Star', speed: 12, available: true)
      innova.discs.create!(name: 'Rhyno', plastic: 'R-Pro', speed: 2, available: false)

      expect(innova.count).to eq(3)
    end

    it '#speed_over' do
      @discraft = Producer.create!(name:'Discraft', number_of_athletes: 65, free_shipping: true)
      @zone = @discraft.discs.create!(name: 'Zone', plastic: 'Glow', speed: 4, available: true)
      @heat = @discraft.discs.create!(name: 'Heat', plastic: 'Big Z', speed: 7, available: true)
      @nuke = @discraft.discs.create!(name: 'Nuke', plastic: 'ESP', speed: 13, available: true)

      expect(@discraft.speed_over(4)).to eq([@heat, @nuke])
    end
  end
end
