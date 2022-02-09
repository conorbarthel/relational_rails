require 'rails_helper'

RSpec.describe 'edit' do

  before(:each) do
    @innova = Producer.create!(name:'Innova', number_of_athletes: 56, free_shipping: true)
    @discraft = Producer.create!(name:'Discraft', number_of_athletes: 65, free_shipping: true)
    @zone = @discraft.discs.create!(name: 'Zone', plastic: 'Glow', speed: 4, available: true)
    @leopard = @innova.discs.create!(name: 'Leopard', plastic: 'DX', speed: 6, available: true)
  end

  it "when the form is filled out information is updated" do
    visit "/discs/#{@leopard.id}"

    expect(page).to have_content("DX")

    visit "/discs/#{@leopard.id}/edit"
    fill_in("Name", with:"Leopard3")
    fill_in("Plastic", with:"Halo")
    fill_in("Speed", with:7)
    fill_in("Producer", with:"#{@innova.id}")
    check("available")
    click_button("Update Disc")

    expect(current_path).to eq("/discs/#{@leopard.id}")
    expect(page).to have_content("Leopard3")
    expect(page).to_not have_content("DX")
    expect(page).to have_content("Halo")
    expect(page).to have_content(7)
    expect(page).to have_content("true")
  end
end
