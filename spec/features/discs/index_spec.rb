require 'rails_helper'

RSpec.describe 'index' do
  before(:each) do
    Disc.destroy_all
    Producer.destroy_all
    @innova = Producer.create!(name:'Innova', number_of_athletes: 56, free_shipping: true)
    @discraft = Producer.create!(name:'Discraft', number_of_athletes: 65, free_shipping: true)
    @zone = @discraft.discs.create!(name: 'Zone', plastic: 'Glow', speed: 4, available: true)
    @leopard = @innova.discs.create!(name: 'Leopard', plastic: 'DX', speed: 6, available: true)
    @rhyno = @innova.discs.create!(name: 'Rhyno', plastic: 'R-Pro', speed: 2, available: false)
  end

  it 'displays the attributes of all discs' do
    visit "/discs"

    expect(page).to have_content(@zone.name)
    expect(page).to have_content(@zone.plastic)
    expect(page).to have_content(@zone.speed)
    expect(page).to have_content(@zone.available)
    expect(page).to have_content(@leopard.name)
    expect(page).to have_content(@leopard.plastic)
    expect(page).to have_content(@leopard.speed)
    expect(page).to have_content(@leopard.available)
    expect(page).to_not have_content(@discraft.name)
  end

  it "only displays available discs" do
    visit "/discs"

    expect(page).to have_content(@zone.name)
    expect(page).to_not have_content(@rhyno.name)
  end

  it "each disc has has a link to edit that disc" do
    visit "/discs"
    click_on "Update #{@zone.name}"

    expect(current_path).to eq("/discs/#{@zone.id}/edit")
  end

  it "has a link to delete each disc" do
    visit "/discs"

    expect(page).to have_selector(:link_or_button, "Delete #{@zone.name}")
    expect(page).to have_content(@leopard.name)
    click_on "Delete #{@leopard.name}"

    expect(current_path).to eq("/discs")
    expect(page).to_not have_content(@leopard.name)
  end
end
