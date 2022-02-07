require 'rails_helper'

RSpec.describe 'director/:id/movies index page', type: :feature do
  before :each do
    @stanley = Director.create!(name: 'Stanley Kubrick', active: false, awards_won: 26)
    @wes = Director.create!(name: 'Wes Anderson', active: true, awards_won: 11)
    @movie_0 = @stanley.movies.create!(title: 'Barry Lyndon', recently_viewed: true, length: 146, genre: 'Drama')
    @movie_1 = @stanley.movies.create!(title: '2001: A Space Odyssey', recently_viewed: true, length: 142, genre: 'Sci-Fi')
    @movie_2 = @stanley.movies.create!(title: 'The Shining', recently_viewed: false, length: 146, genre: 'Horror')
    @movie_3 = @wes.movies.create!(title: 'The Grand Budapest Hotel', recently_viewed: true, length: 142, genre: 'Comedy-Drama')
    @movie_4 = @wes.movies.create!(title: 'The Life Aqatic with Steve Zissou', recently_viewed: false, length: 118, genre: 'Comedy-Drama')
  end

  describe 'User Story 5' do
    it 'displays the director and movies with attributes' do

      visit "/directors/#{@stanley.id}/movies"

      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content("Recently Viewed: #{@movie_1.recently_viewed}")
      expect(page).to have_content("Length: #{@movie_1.length}")
      expect(page).to have_content("Genre: #{@movie_1.genre}")
      expect(page).to have_content(@movie_2.title)
      expect(page).to have_content("Recently Viewed: #{@movie_2.recently_viewed}")
      expect(page).to have_content("Length: #{@movie_2.length}")
      expect(page).to have_content("Genre: #{@movie_2.genre}")
      expect(page).to_not have_content(@movie_3.title)
    end
  end

  # User Story 16, Sort Parent's Children in Alphabetical Order by name
  # As a visitor // When I visit the Parent's children Index Page
  # Then I see a link to sort children in alphabetical order
  # When I click on the link
  # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
  describe 'User Story 16' do
    xit 'displays link "Sort Movies A->Z" to /director/:id/movies' do
      visit "/directors/#{@stanley.id}/movies"
      click_on "Sort Movies A->Z"
      expect(current_path).to eq("/directors/#{@stanley.id}/movies")
      expect(@movie_1.name).to appear_before(@movie_2)
      expect(@movie_0.name).to appear_before(@movie_3.name)
    end
  end
end
