require 'rails_helper'


RSpec.describe 'the producer new page' do
  before(:each) do
    @innova = Producer.create(name:'Innova', number_of_athletes: 56, free_shipping: true)
    @discraft = Producer.create(name:'Discraft', number_of_athletes: 65, free_shipping: true)
  end

  it "creates a new producer, redirects to the index page, and shows the producer there" do

    visit "/producers/new"
    fill_in("Name", with:"Discmainia")
    fill_in("Number of athletes", with:89)
    check('Free shipping')
    click_button("Create Producer")
    #save_and_open_page

    expect(current_path).to eq('/producers')
    expect(page).to have_content("Discmainia")
  end
end
