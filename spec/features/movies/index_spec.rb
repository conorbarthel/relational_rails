require 'rails_helper'

RSpec.describe 'movies index page', type: :feature do
  # User Story 3, Child Index (x2)
  # As a visitor // When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes:
  it 'display all movies and attributes' do
    director = Director.create!(name: "Darren Aronofsky", active: true, awards_won: 10)
    fountain = director.movies.create!(title: "The Fountain", recently_viewed: true, length: 120, genre: "Drama")
    requiem = director.movies.create!(title: "Requiem for a Dream", recently_viewed: false, length: 115, genre: "Drama")

    visit "/movies"

    expect(page).to have_content(fountain.title)
    expect(page).to have_content("Recently Viewed: #{fountain.recently_viewed}")
    expect(page).to have_content("Length: #{fountain.length}")
    expect(page).to have_content("Genre: #{fountain.genre}")
    expect(page).to have_content(requiem.title)
    expect(page).to have_content("Recently Viewed: #{requiem.recently_viewed}")
    expect(page).to have_content("Length: #{requiem.length}")
    expect(page).to have_content("Genre: #{requiem.genre}")
    expect(page).to_not have_content(director.name)
  end
end
