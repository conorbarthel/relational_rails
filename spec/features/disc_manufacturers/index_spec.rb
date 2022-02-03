require 'rails_helper'


RSpec.describe 'the disc_manufaturer index page' do
  it 'displats the name of all disc_manufaturers' do
    innova = DiscManufaturer.create(name:'Innova', number_of_athletes: 56, free_shipping: true)
    discraft = DiscManufaturer.create(name:'Discraft', number_of_athletes: 65, free_shipping: true)

    visit "/disc_manufaturers"

    expect(page).to have_content(innova.name)
    expect(page).to have_content(discraft.name)
  end
end
