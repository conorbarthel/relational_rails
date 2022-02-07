require 'rails_helper'

RSpec.describe 'directors/:id/movies/new page', type: :feature do
  before :each do
    @stanley = Director.create!(name: 'Stanley Kubrick', active: false, awards_won: 26)
    @wes = Director.create!(name: 'Wes Anderson', active: true, awards_won: 11)
    @movie_0 = @stanley.movies.create!(title: 'Barry Lyndon', recently_viewed: true, length: 146, genre: 'Drama')
    @movie_1 = @stanley.movies.create!(title: '2001: A Space Odyssey', recently_viewed: false, length: 142, genre: 'Sci-Fi')
  end

  describe 'User Story 13' do
    it 'displays link "Add Movie" to /director/:id/movies' do
      visit "/directors/#{@stanley.id}/movies"

      click_on "Add Movie"
      expect(current_path).to eq("/directors/#{@stanley.id}/movies/new")
    end

    it 'allows Movie to be added - redirects to directors_movies' do
      visit "/directors/#{@stanley.id}/movies"
      expect(page).to_not have_content("The Shining")

      click_on "Add Movie"

      fill_in(:title, with: "The Shining")
      fill_in(:length, with: 200)
      fill_in(:genre, with: "Horror")
      check('Recently viewed')

      click_button "Create Movie"

      expect(current_path).to eq("/directors/#{@stanley.id}/movies")
      expect(page).to have_content("The Shining")
    end
  end
end
