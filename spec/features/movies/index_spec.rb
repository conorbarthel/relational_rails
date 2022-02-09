require 'rails_helper'

RSpec.describe 'movies index page', type: :feature do
  before :each do
    @director = Director.create!(name: "Darren Aronofsky", active: true, awards_won: 10)
    @fountain = @director.movies.create!(title: "The Fountain", recently_viewed: true, length: 120, genre: "Drama")
    @mother = @director.movies.create!(title: "Mother", recently_viewed: true, length: 120, genre: "Drama")
    @requiem = @director.movies.create!(title: "Requiem for a Dream", recently_viewed: false, length: 115, genre: "Drama")
  end

  describe 'User Story 3' do
    it 'display movies with attributes' do

      visit "/movies"

      expect(page).to have_content(@fountain.title)
      expect(page).to have_content("Recently Viewed: #{@fountain.recently_viewed}")
      expect(page).to have_content("Length: #{@fountain.length}")
      expect(page).to have_content("Genre: #{@fountain.genre}")
      expect(page).to_not have_content(@director.name)
    end
  end

  describe 'User Story 15' do
    it 'display only movies that have been recently viewed' do
      visit "/movies"

      expect(page).to have_content(@fountain.title)
      expect(page).to have_content(@mother.title)
      expect(page).to_not have_content(@requiem.title)
    end
  end

  describe 'User Story 23' do
    it 'display only movies that have been recently viewed' do
      visit "/movies"

      expect(page).to have_content("The Fountain")

      click_on "Delete #{@fountain.title}"

      expect(current_path).to eq("/movies")
      expect(page).to_not have_content("The Fountain")

      visit "directors/#{@director.id}/movies"

      expect(page).to have_content("Mother")

      click_on "Delete #{@mother.title}"

      expect(current_path).to eq("/movies")
      expect(page).to_not have_content("Mother")
    end
  end
end
