require 'rails_helper'

RSpec.describe 'index' do
  before(:each) do
    @innova = Producer.create!(name:'Innova', number_of_athletes: 56, free_shipping: true)
    @discraft = Producer.create!(name:'Discraft', number_of_athletes: 65, free_shipping: true)
    @zone = @discraft.discs.create!(name: 'Zone', plastic: 'Glow', speed: 4, available: true)
    @heat = @discraft.discs.create!(name: 'Heat', plastic: 'Big Z', speed: 7, available: true)
    @nuke = @discraft.discs.create!(name: 'Nuke', plastic: 'ESP', speed: 13, available: true)
    @leopard = @innova.discs.create!(name: 'Leopard', plastic: 'DX', speed: 6, available: true)
  end

  it 'displays the attributes of a disc and producer it belongs to' do
    visit "/producers/#{@discraft.id}/discs"

    expect(page).to have_content(@zone.name)
    expect(page).to have_content(@zone.plastic)
    expect(page).to have_content(@zone.speed)
    expect(page).to have_content(@zone.available)
    expect(page).to have_content(@nuke.name)
    expect(page).to have_content(@nuke.plastic)
    expect(page).to have_content(@nuke.speed)
    expect(page).to have_content(@nuke.available)
    expect(page).to_not have_content(@leopard.name)
  end

  it "links to /producers/id:/discs/new" do
    visit "/producers/#{@discraft.id}/discs"

    click_on "New Disc"
    expect(current_path).to eq("/producers/#{@discraft.id}/discs/new")
  end

  it "can sort discs by alphabetical order" do
    visit "/producers/#{@discraft.id}/discs"
    expect("Zone").to appear_before("Nuke")

    click_on "Sort Alphabeticaly"

    expect(current_path).to eq("/producers/#{@discraft.id}/discs")
    expect("Nuke").to appear_before("Zone")
  end

  it "each disc has has a link to edit that disc" do
    visit "/producers/#{@discraft.id}/discs"

    click_on "Update #{@zone.name}"

    expect(current_path).to eq("/discs/#{@zone.id}/edit")
  end

  it "has a form to return discs with more than a given speed" do
    visit "/producers/#{@discraft.id}/discs"
    expect(page).to have_content(@zone.name)
    fill_in("Speed:", with:5)
    click_on "Only return discs with more than entered speed"

    expect(current_path).to eq("/producers/#{@discraft.id}/discs")
    expect(page).to_not have_content(@zone.name)
  end

  it "has a link to delete each disc" do
    visit "/producers/#{@discraft.id}/discs"
    expect(page).to have_content(@heat.name)
    click_on "Delete #{@heat.name}"

    expect(current_path).to eq("/discs")
    expect(page).to_not have_content(@heat.name)
  end
end
