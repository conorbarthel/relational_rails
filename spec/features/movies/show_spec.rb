require 'rails_helper'

RSpec.describe 'movie show page', type: :feature do
  # User Story 4, Child Show (x2)
  #
  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes:

  it 'displays the movie name and attributes' do
    director = Director.create!(name: "Darren Aronofsky", active: true, awards_won: 10)
    movie_1 = director.movies.create!(title: "The Fountain", released: true, length: 120, genre: "Drama")
    movie_2 = director.movies.create!(title: "Requiem for a Dream", released: true, length: 115, genre: "Drama")

    visit "/movies/#{movie_1.id}"
    # save_and_open_page
    expect(page).to have_content(movie_1.title)
    expect(page).to have_content("Released: #{movie_1.released}")
    expect(page).to have_content("Length: #{movie_1.length}")
    expect(page).to have_content("Genre: #{movie_1.genre}")
    expect(page).to_not have_content(movie_2.title)
    expect(page).to_not have_content(director.name)
  end
end
