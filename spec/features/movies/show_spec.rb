require 'rails_helper'

RSpec.describe 'movie show page', type: :feature do
  before :each do
    @director = Director.create!(name: "Darren Aronofsky", active: true, awards_won: 10)
    @movie_1 = @director.movies.create!(title: "The Fountain", recently_viewed: true, length: 120, genre: "Drama")
    @movie_2 = @director.movies.create!(title: "Requiem for a Dream", recently_viewed: false, length: 115, genre: "Drama")
  end

  describe 'User Story 4' do
    it 'displays the movie name and attributes' do

      visit "/movies/#{@movie_1.id}"

      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content("Recently Viewed: #{@movie_1.recently_viewed}")
      expect(page).to have_content("Length: #{@movie_1.length}")
      expect(page).to have_content("Genre: #{@movie_1.genre}")
      expect(page).to_not have_content(@movie_2.title)
      expect(page).to_not have_content(@director.name)
    end
  end

  describe 'User Story 20' do
    it 'displays the movie name and attributes' do
      visit "/movies/#{@movie_1.id}"

      click_on "Delete Movie"

      expect(current_path).to eq("/movies")
      expect(page).to_not have_content("#{@movie_1.title}")

      visit '/directors'
      expect(page).to have_content("#{@director.name}")
    end
  end
end
