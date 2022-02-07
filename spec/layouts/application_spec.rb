require 'rails_helper'

RSpec.describe 'director index page', type: :feature do
  before :each do
    @stanley = Director.create!(name: 'Stanley Kubrick', active: false, awards_won: 26)
    @movie_1 = @stanley.movies.create!(title: '2001: A Space Odyssey', recently_viewed: true, length: 142, genre: 'Sci-Fi')
  end

  # User Story 8, Child Index Link
  # As a visitor // When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  it '/directors links to Movies index' do
    visit "/directors"
    click_on "Movies"
    expect(current_path).to eq("/movies")
  end

  it '/movies links to Movies index' do
    visit "/movies"
    click_on "Movies"
    expect(current_path).to eq("/movies")
  end

  it '/directors/:id links to Movies index' do
    visit "/directors/#{@stanley.id}"
    click_on "Movies"
    expect(current_path).to eq("/movies")
  end

  it '/movies/:id links to Movies index' do
    visit "/movies/#{@movie_1.id}"
    click_on "Movies"
    expect(current_path).to eq("/movies")
  end

  it '/directors/:id/movies links to Movies index' do
    visit "/directors/#{@stanley.id}/movies"
    click_on "Movies"
    expect(current_path).to eq("/movies")
  end

  it "all pages link to the /discs page" do
    pages = ["directors", "movies", "discs", "producers", "directors/#{@stanley.id}", "directors/#{@stanley.id}/movies"]
    visit "/#{pages.sample}"
    click_on "Discs"
    expect(current_path).to eq("/discs")
  end

  # User Story 9, Parent Index Link
  # As a visitor // When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index


  # User Story 9, Parent Index Link
  # As a visitor // When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index
  it '/directors displays link to Director Index' do
    visit "/directors"
    click_on "Directors"
    expect(current_path).to eq("/directors")
  end

  it '/movies displays link to Director Index' do
    visit "/movies"
    click_on "Directors"
    expect(current_path).to eq("/directors")
  end

  it '/directors/:id displays link to Director Index' do
    visit "/directors/#{@stanley.id}"
    click_on "Directors"
    expect(current_path).to eq("/directors")
  end

  it '/movies/:id displays link to Director Index' do
    visit "/movies/#{@movie_1.id}"
    click_on "Directors"
    expect(current_path).to eq("/directors")
  end

  it '/directors/:id/movies displays link to Director Index' do
    visit "/directors/#{@stanley.id}/movies"
    click_on "Directors"
    expect(current_path).to eq("/directors")
  end

  it "all pages link to the /producers page" do
    pages = ["directors", "movies", "discs", "producers", "directors/#{@stanley.id}", "directors/#{@stanley.id}/movies"]
    visit "/#{pages.sample}"
    click_on "Producers"
    expect(current_path).to eq("/producers")
  end
end
