require 'rails_helper'

RSpec.describe 'director index page', type: :feature do
  before :each do
    @stanley = Director.create!(name: 'Stanley Kubrick', active: false, awards_won: 26)
    @wes = Director.create!(name: 'Wes Anderson', active: true, awards_won: 11)
    @denis = Director.create!(name: 'Denis Villenueve', active: true, awards_won: 9)
    @movie_0 = @stanley.movies.create!(title: 'Barry Lyndon', recently_viewed: true, length: 146, genre: 'Drama')
    @movie_1 = @stanley.movies.create!(title: '2001: A Space Odyssey', recently_viewed: true, length: 142, genre: 'Sci-Fi')
    @movie_2 = @stanley.movies.create!(title: 'The Shining', recently_viewed: false, length: 146, genre: 'Horror')
    @movie_3 = @wes.movies.create!(title: 'The Grand Budapest Hotel', recently_viewed: true, length: 142, genre: 'Comedy-Drama')
    @movie_4 = @wes.movies.create!(title: 'The Life Aqatic with Steve Zissou', recently_viewed: false, length: 118, genre: 'Comedy-Drama')
  end

  describe 'User Story 1' do
    it 'displays the director name' do

      visit "/directors"

      expect(page).to have_content(@stanley.name)
      expect(page).to have_content(@wes.name)
      expect(page).to_not have_content(@movie_2.title)
      expect(page).to_not have_content(@movie_3.title)
    end
  end

  describe 'User Story 6' do
    it 'displays the director and movies with attributes - create date descending' do

      visit "/directors"

      expect(page).to have_content(@stanley.created_at)
      expect(page).to have_content(@wes.created_at)
      expect(@denis.name).to appear_before(@wes.name)
      expect(@wes.name).to appear_before(@stanley.name)
    end
  end
end
