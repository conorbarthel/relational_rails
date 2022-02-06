require 'rails_helper'

RSpec.describe 'movie edit page', type: :feature do
  before :each do
    @director = Director.create!(name: "Darren Aronofsky", active: true, awards_won: 10)
    @movie_1 = @director.movies.create!(title: "The Fountain", recently_viewed: false, length: 120, genre: "Drama")
  end

  # User Story 14, Child Update (x2)
  # When I click the button to submit the form "Update Child"
  # Then a `PATCH` request is sent to '/child_table_name/:id',
  # the child's data is updated,
  # and I am redirected to the Child Show page where I see the Child's updated information
  it 'can edit a movie and redirect to the Movie Show Page' do
    visit "/movies/#{@movie_1.id}"
    expect(page).to have_content("Recently Viewed: false")
    click_on "Update Movie"

    fill_in(:title, with: 'The Fountain')
    fill_in(:length, with: 120)
    fill_in(:genre, with: "Drama")
    check('Recently viewed')

    click_button "Submit Updates"

    expect(current_path).to eq("/movies/#{@movie_1.id}")
    expect(page).to have_content("Recently Viewed: true")
  end
end
