require 'rails_helper'

RSpec.describe 'the producer index page' do

# User Story 2, Parent Show (x2)
#
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table
  it 'displays the name of all producers' do
    innova = Producer.create(name:'Innova', number_of_athletes: 56, free_shipping: true)
    discraft = Producer.create(name:'Discraft', number_of_athletes: 65, free_shipping: true)

    visit "/producers/#{innova.id}"

    expect(page).to have_content(innova.name)
    expect(page).to have_content(innova.number_of_athletes)
    expect(page).to have_content(innova.free_shipping)
    expect(page).to_not have_content(discraft.name)
  end
end
