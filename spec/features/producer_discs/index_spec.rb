require 'rails_helper'

RSpec.describe 'index' do
  it 'displays the attributes of a disc and producer it belongs to' do
    innova = Producer.create!(name:'Innova', number_of_athletes: 56, free_shipping: true)
    discraft = Producer.create!(name:'Discraft', number_of_athletes: 65, free_shipping: true)
    zone = discraft.discs.create!(name: 'Zone', plastic: 'Glow', speed: 4, available: true)
    nuke = discraft.discs.create!(name: 'Nuke', plastic: 'ESP', speed: 13, available: true)
    leopard = innova.discs.create!(name: 'Leopard', plastic: 'DX', speed: 6, available: true)

    visit "/producers/#{discraft.id}/discs"
    #save_and_open_page

    expect(page).to have_content(zone.name)
    expect(page).to have_content(zone.plastic)
    expect(page).to have_content(zone.speed)
    expect(page).to have_content(zone.available)
    expect(page).to have_content(nuke.name)
    expect(page).to have_content(nuke.plastic)
    expect(page).to have_content(nuke.speed)
    expect(page).to have_content(nuke.available)
    expect(page).to_not have_content(leopard.name)
  end

  it "links to /producers/id:/discs/new" do
    discraft = Producer.create!(name:'Discraft', number_of_athletes: 65, free_shipping: true)
    zone = discraft.discs.create!(name: 'Zone', plastic: 'Glow', speed: 4, available: true)
    visit "/producers/#{discraft.id}/discs"
    #save_and_open_page
    click_on "New Disc"
    expect(current_path).to eq("/producers/#{discraft.id}/discs/new")
  end
end
