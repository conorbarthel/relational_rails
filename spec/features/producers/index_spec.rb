require 'rails_helper'


RSpec.describe 'the producer index page' do
  it 'displays the name of all producers' do
    innova = Producer.create(name:'Innova', number_of_athletes: 56, free_shipping: true)
    discraft = Producer.create(name:'Discraft', number_of_athletes: 65, free_shipping: true)

    visit "/producers"

    expect(page).to have_content(innova.name)
    expect(page).to have_content(discraft.name)
  end

  it "displays the name of producers in order from most recently created" do
    innova = Producer.create!(name:'Innova', number_of_athletes: 56, free_shipping: true)
    discraft = Producer.create!(name:'Discraft', number_of_athletes: 65, free_shipping: true)

    visit "/producers"

    within '#disc_1' do
      expect(discraft.name).to appear_before(innova.name)
    end
  end
end
