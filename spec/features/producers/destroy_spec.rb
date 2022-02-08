require 'rails_helper'

RSpec.describe "delete" do
  before(:each) do
    Disc.destroy_all
    Producer.destroy_all
    @innova = Producer.create!(name:'Innova', number_of_athletes: 56, free_shipping: true)
    @discraft = Producer.create!(name:'Discraft', number_of_athletes: 65, free_shipping: true)
    @zone = @discraft.discs.create!(name: 'Zone', plastic: 'Glow', speed: 4, available: true)
    @leopard = @innova.discs.create!(name: 'Leopard', plastic: 'DX', speed: 6, available: true)
  end

  it "can delete producers" do
    visit "producers/#{@discraft.id}"
    expect(page).to have_content("#{@discraft.name}")
    click_on "Delete Producer"
    expect(page).to_not have_content("#{@discraft.name}")
  end
end
