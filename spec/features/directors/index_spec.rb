require 'rails_helper'

RSpec.describe 'director index page', type: :feature do
  # User Story 1, Parent Index (x2)
  #
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  it 'displays the director name' do
    director = Director.create!(name: "Darren Aronofsky", active: true, awards_won: 10)
    fountain = director.movies.create!(title: "The Fountain", recently_viewed: true, length: 120, genre: "Drama")
    requiem = director.movies.create!(title: "Requiem for a Dream", recently_viewed: false, length: 115, genre: "Drama")

    visit "/directors"
    # save_and_open_page
    expect(page).to have_content(director.name)
    expect(page).to_not have_content(fountain)
  end
end
