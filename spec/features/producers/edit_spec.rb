require 'rails_helper'

RSpec.describe 'the producer edit page' do
  before(:each) do
    @innova = Producer.create(name:'Innova', number_of_athletes: 56, free_shipping: true)
    @discraft = Producer.create(name:'Discraft', number_of_athletes: 65, free_shipping: true)
  end

  it "when the form is filled out producer information is updated" do
    visit "/producers/#{@innova.id}"

    expect(page).to have_content(56)
    expect(page).to have_content("true")
    
    visit "/producers/#{@innova.id}/edit"
    fill_in("Name", with:"Innova")
    fill_in("Number of athletes", with:14)
    click_button("Update Producer")


    expect(current_path).to eq("/producers/#{@innova.id}")
    expect(page).to have_content("Innova")
    expect(page).to have_content(14)
    expect(page).to have_content("false")
  end
end
