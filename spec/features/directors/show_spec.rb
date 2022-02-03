require 'rails_helper'

RSpec.describe 'director show page', type: :feature do
  # User Story 2, Parent Show (x2)
  #
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes:
  # - data from each column that is on the parent table

  it 'displays the director name and attributes' do
    director = Director.create!(name: "Darren Aronofsky", active: true, awards_won: 10)
    fountain = director.movies.create!(title: "The Fountain", recently_viewed: true, length: 120, genre: "Drama")
    requiem = director.movies.create!(title: "Requiem for a Dream", recently_viewed: false, length: 115, genre: "Drama")

    visit "/directors/#{director.id}"
    expect(page).to have_content(director.name)
    expect(page).to have_content("Currently Active: #{director.active}")
    expect(page).to have_content("Awards Won: #{director.awards_won}")
    expect(page).to_not have_content(fountain)
  end
end
