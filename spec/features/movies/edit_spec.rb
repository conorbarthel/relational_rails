require 'rails_helper'

RSpec.describe 'movie edit page', type: :feature do
  before :each do
    @director = Director.create!(name: "Darren Aronofsky", active: true, awards_won: 10)
    @fountain = @director.movies.create!(title: "The Fountain", recently_viewed: true, length: 120, genre: "Drama")
    @mother = @director.movies.create!(title: "Mother", recently_viewed: true, length: 120, genre: "Drama")
    @requiem = @director.movies.create!(title: "Requiem for a Dream", recently_viewed: false, length: 115, genre: "Drama")
  end

  describe 'User Story 14' do
    it 'displays Update Director link to directors/:id/edit' do
      visit "/movies/#{@fountain.id}"

      click_on "Update Movie"

      expect(current_path).to eq("/movies/#{@fountain.id}/edit")
    end

    it 'can edit a movie and redirect to the Movie Show Page' do
      visit "/movies/#{@fountain.id}"
      expect(page).to have_content("Length: 120")
      click_on "Update Movie"

      fill_in(:title, with: 'The Fountain')
      fill_in(:length, with: 126)
      fill_in(:genre, with: "Drama")
      check('Recently viewed')

      click_button "Submit Updates"

      expect(current_path).to eq("/movies/#{@fountain.id}")
      expect(page).to have_content("Length: 126")
    end
  end

  # User Story 18, Child Update From Childs Index Page (x1)
  # As a visitor
  # When I visit the `child_table_name` index page or a parent `child_table_name` index page
  # Next to every child, I see a link to edit that child's info
  # When I click the link
  # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
  describe 'User Story 18' do
    it 'from child index - displays link to edit movie - next to each movie' do
      visit "/movies"

      expect("The Fountain").to appear_before("Edit #{@fountain.title}")
      expect("Edit #{@fountain.title}").to appear_before("Mother")

      click_on "Edit #{@fountain.title}"
      expect(current_path).to eq("/movies/#{@fountain.id}/edit")
    end

    it 'from parent/children index - displays link to edit movie - next to each movie' do
      visit "directors/#{@director.id}/movies"

      expect("The Fountain").to appear_before("Edit #{@fountain.title}")
      expect("Edit #{@fountain.title}").to appear_before("Mother")

      click_on "Edit #{@fountain.title}"
      expect(current_path).to eq("/movies/#{@fountain.id}/edit")
    end
  end
end
