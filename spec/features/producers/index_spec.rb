require 'rails_helper'


RSpec.describe 'the producer index page' do
  before(:each) do
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

  it "has a link to create a new producer record" do

    visit "/producers"
    #save_and_open_page
    click_on "New Producer"

    expect(current_path).to eq('/producers/new')
  end
end
