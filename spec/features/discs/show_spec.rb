require 'rails_helper'

RSpec.describe 'show' do

  before(:each) do
    @innova = Producer.create!(name:'Innova', number_of_athletes: 56, free_shipping: true)
    @discraft = Producer.create!(name:'Discraft', number_of_athletes: 65, free_shipping: true)
    @zone = @discraft.discs.create!(name: 'Zone', plastic: 'Glow', speed: 4, available: true)
    @leopard = @innova.discs.create!(name: 'Leopard', plastic: 'DX', speed: 6, available: true)
  end

  it 'displays the attributes of a discs' do

    visit "/discs/#{@zone.id}"

    expect(page).to have_content(@zone.name)
    expect(page).to have_content(@zone.plastic)
    expect(page).to have_content(@zone.speed)
    expect(page).to have_content(@zone.available)
    expect(page).to_not have_content(@leopard.name)
    expect(page).to_not have_content(@discraft.name)
  end

  it 'has a link to update disc' do
    visit "/discs/#{@leopard.id}"
    click_on "Update #{@leopard.name}"

    expect(current_path).to eq("/discs/#{@leopard.id}/edit")
  end
end
