require 'rails_helper'

RSpec.describe 'movies index page', type: :feature do
  describe 'User Story 3' do
    it 'display movies with attributes' do
      director = Director.create!(name: "Darren Aronofsky", active: true, awards_won: 10)
      fountain = director.movies.create!(title: "The Fountain", recently_viewed: true, length: 120, genre: "Drama")
      requiem = director.movies.create!(title: "Requiem for a Dream", recently_viewed: false, length: 115, genre: "Drama")

      visit "/movies"

      expect(page).to have_content(fountain.title)
      expect(page).to have_content("Recently Viewed: #{fountain.recently_viewed}")
      expect(page).to have_content("Length: #{fountain.length}")
      expect(page).to have_content("Genre: #{fountain.genre}")
      expect(page).to_not have_content(director.name)
    end
  end

  describe 'User Story 15' do
    it 'display only movies that have been recently viewed' do
      director = Director.create!(name: "Darren Aronofsky", active: true, awards_won: 10)
      fountain = director.movies.create!(title: "The Fountain", recently_viewed: true, length: 120, genre: "Drama")
      mother = director.movies.create!(title: "Mother", recently_viewed: true, length: 120, genre: "Drama")
      requiem = director.movies.create!(title: "Requiem for a Dream", recently_viewed: false, length: 115, genre: "Drama")

      visit "/movies"

      expect(page).to have_content(fountain.title)
      expect(page).to have_content(mother.title)
      expect(page).to_not have_content(requiem.title)
    end
  end
end
