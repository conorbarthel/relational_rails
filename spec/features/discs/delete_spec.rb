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

  it "can delete discs from show page" do
    visit "discs/#{@leopard.id}"

    expect(page).to have_content("#{@leopard.name}")
    click_on "Delete Disc"
    
    expect(page).to_not have_content("#{@leopard.name}")
  end
end
