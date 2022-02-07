require 'rails_helper'

RSpec.describe 'director show page', type: :feature do
  before :each do
    @stanley = Director.create!(name: 'Stanley Kubrick', active: false, awards_won: 26)
    @wes = Director.create!(name: 'Wes Anderson', active: true, awards_won: 11)
    @movie_0 = @stanley.movies.create!(title: 'Barry Lyndon', recently_viewed: true, length: 146, genre: 'Drama')
    @movie_1 = @stanley.movies.create!(title: '2001: A Space Odyssey', recently_viewed: true, length: 142, genre: 'Sci-Fi')
    @movie_2 = @stanley.movies.create!(title: 'The Shining', recently_viewed: false, length: 146, genre: 'Horror')
    @movie_3 = @wes.movies.create!(title: 'The Grand Budapest Hotel', recently_viewed: true, length: 142, genre: 'Comedy-Drama')
    @movie_4 = @wes.movies.create!(title: 'The Life Aqatic with Steve Zissou', recently_viewed: false, length: 118, genre: 'Comedy-Drama')
  end

  describe 'User Story 2' do
    it 'displays the director name and attributes' do

      visit "/directors/#{@stanley.id}"

      expect(page).to have_content(@stanley.name)
      expect(page).to have_content("Currently Active: #{@stanley.active}")
      expect(page).to have_content("Awards Won: #{@stanley.awards_won}")
      expect(page).to_not have_content(@movie_1)
      expect(page).to_not have_content(@movie_2)
    end
  end

  describe 'User Story 7' do
    it 'displays the directors movie count' do

      visit "/directors/#{@stanley.id}"

      expect(page).to have_content("Movie Count: #{@stanley.movies.count}")
    end
  end

  describe 'User Story 10' do
    it 'displays link to directors/:id/movies' do

      visit "/directors/#{@stanley.id}"

      click_on "#{@stanley.name} Movies"

      expect(current_path).to eq("/directors/#{@stanley.id}/movies")
    end
  end

  describe 'User Story 19' do
    it 'displays a delete director link on show page' do
      visit "/directors/#{@stanley.id}"

      expect(page).to have_content("Delete Director")
    end

    it 'deletes director and ALL movies - redirects to parent index page' do
      visit "/directors/#{@stanley.id}"

      click_on "Delete Director"

      expect(current_path).to eq("/directors")
      expect(page).to_not have_content("Stanley Kubrick")

      visit "/movies"
      expect(page).to_not have_content("Barry Lyndon")
    end
  end
end
