require 'rails_helper'

RSpec.describe 'movies index page', type: :feature do
  # User Story 3, Child Index (x2)
  #
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes:

  it 'display all movies and attributes' do
    director = Director.create!(name: "Darren Aronofsky", active: true, awards_won: 10)
    movie_1 = director.movies.create!(title: "The Fountain", released: true, length: 120, genre: "Drama")
    movie_2 = director.movies.create!(title: "Requiem for a Dream", released: true, length: 115, genre: "Drama")

    visit "/movies"
    save_and_open_page
    expect(page).to have_content(movie_1.title)
    expect(page).to have_content("Released: #{movie_1.released}")
    expect(page).to have_content("Length: #{movie_1.length}")
    expect(page).to have_content("Genre: #{movie_1.genre}")
    expect(page).to have_content(movie_2.title)
    expect(page).to have_content("Released: #{movie_2.released}")
    expect(page).to have_content("Length: #{movie_1.length}")
    expect(page).to have_content("Genre: #{movie_1.genre}")
    expect(page).to_not have_content(director.name)
  end
end
