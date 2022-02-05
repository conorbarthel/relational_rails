require 'rails_helper'

RSpec.describe 'movie show page', type: :feature do
  before :each do
    @director = Director.create!(name: "Darren Aronofsky", active: true, awards_won: 10)
    @movie_1 = @director.movies.create!(title: "The Fountain", recently_viewed: true, length: 120, genre: "Drama")
    @movie_2 = @director.movies.create!(title: "Requiem for a Dream", recently_viewed: false, length: 115, genre: "Drama")
  end

  # User Story 4, Child Show (x2)
  # As a visitor // When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes:
  it 'displays the movie name and attributes' do

    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content("Recently Viewed: #{@movie_1.recently_viewed}")
    expect(page).to have_content("Length: #{@movie_1.length}")
    expect(page).to have_content("Genre: #{@movie_1.genre}")
    expect(page).to_not have_content(@movie_2.title)
    expect(page).to_not have_content(@director.name)
  end

  # User Story 8, Child Index Link
  # As a visitor // When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  it 'displays link to Child Index' do

    visit "/movies/#{@movie_1.id}"

    click_on "Movies"

    expect(current_path).to eq("/movies")
  end

  # User Story 9, Parent Index Link
  # As a visitor // When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index
  it 'displays link to Parent Index' do

    visit "/movies/#{@movie_1.id}"

    click_on "Directors"

    expect(current_path).to eq("/directors")
  end
end
