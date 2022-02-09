require 'rails_helper'

RSpec.describe 'index' do
  before(:each) do
    @innova = Producer.create!(name:'Innova', number_of_athletes: 56, free_shipping: true)
    @discraft = Producer.create!(name:'Discraft', number_of_athletes: 65, free_shipping: true)
    @zone = @discraft.discs.create!(name: 'Zone', plastic: 'Glow', speed: 4, available: true)
    @leopard = @innova.discs.create!(name: 'Leopard', plastic: 'DX', speed: 6, available: true)
  end

  it "creates a new discs, redirects to the index page, and shows the discs there" do
    visit "/discs"

    expect(page).to_not have_content("Undertaker")

    visit "producers/#{@discraft.id}/discs/new"
    fill_in("Name", with:"Undertaker")
    fill_in("Plastic", with:"ESP")
    fill_in("Speed", with:9)
    check('Available')
    fill_in("Producer", with:"#{@discraft.id}")
    click_button("Create Disc")
    
    expect(current_path).to eq('/discs')
    expect(page).to have_content("Undertaker")
  end
end
