require 'rails_helper'

RSpec.describe 'index' do
  it 'displays the attributes of a discs' do
    innova = Producer.create!(name:'Innova', number_of_athletes: 56, free_shipping: true)
    discraft = Producer.create!(name:'Discraft', number_of_athletes: 65, free_shipping: true)
    zone = discraft.discs.create!(name: 'Zone', plastic: 'Glow', speed: 4, available: true)
    leopard = innova.discs.create!(name: 'Leopard', plastic: 'DX', speed: 6, available: true)

    visit "/discs/#{disc.id}"

    expect(page).to have_content(zone.name)
    expect(page).to have_content(zone.plastic)
    expect(page).to have_content(zone.speed)
    expect(page).to have_content(zone.available)
    expect(page).to_not have_content(leopard.name)
    expect(page).to_not have_content(discraft.name)
  end
end
