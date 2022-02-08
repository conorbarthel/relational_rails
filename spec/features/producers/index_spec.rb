require 'rails_helper'

RSpec.describe 'the producer index page' do
  before(:each) do
    Disc.destroy_all
    Producer.destroy_all
    @innova = Producer.create(name:'Innova', number_of_athletes: 56, free_shipping: true)
    @discraft = Producer.create(name:'Discraft', number_of_athletes: 65, free_shipping: true)
  end

  it 'displays the name of all producers' do
    visit "/producers"

    expect(page).to have_content(@innova.name)
    expect(page).to have_content(@discraft.name)
  end

  it "displays the name of producers in order from most recently created" do
    visit "/producers"

    within '#producer_list' do
      expect(@discraft.name).to appear_before(@innova.name)
    end
  end

  it "has a link to edit each producer" do
    visit "/producers"
    click_on "Edit #{@discraft.name} Info"

    expect(current_path).to eq("/producers/#{@discraft.id}/edit")
  end

  it "has a link to create a new producer record" do
    visit "/producers"
    click_on "New Producer"

    expect(current_path).to eq('/producers/new')
  end

  it "has a link to delete each producer" do
    visit "/producers"
    expect(page).to have_content(@innova.name)
    click_on "Delete #{@innova.name}"

    expect(current_path).to eq("/producers")
    expect(page).to_not have_content(@innova.name)
  end
end
