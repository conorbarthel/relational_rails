require 'rails_helper'

RSpec.describe Disc do
  describe 'relationships' do
    it {should belong_to :producer}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :speed}
    it {should validate_presence_of :plastic}
    it {should allow_value(true).for(:available)}
    it {should allow_value(false).for(:available)}
  end

  describe 'class methods' do
    it '#speed_over' do
      @discraft = Producer.create!(name:'Discraft', number_of_athletes: 65, free_shipping: true)
      @zone = @discraft.discs.create!(name: 'Zone', plastic: 'Glow', speed: 4, available: true)
      @heat = @discraft.discs.create!(name: 'Heat', plastic: 'Big Z', speed: 7, available: true)
      @nuke = @discraft.discs.create!(name: 'Nuke', plastic: 'ESP', speed: 13, available: true)

      expect(@discraft.speed_over(4)).to eq([@heat, @nuke])
    end
  end
end
