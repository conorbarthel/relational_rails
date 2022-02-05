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
  # User Story 1, Parent Index (x2)
  # For each parent table
  # As a visitor // When I visit '/parents'
  # Then I see the name of each parent record in the system
  it 'displays the director name' do

    visit "/directors"

    expect(page).to have_content(@stanley.name)
    expect(page).to have_content(@wes.name)
    expect(page).to_not have_content(@movie_2.title)
    expect(page).to_not have_content(@movie_3.title)
  end

  # User Story 6, Parent Index sorted by Most Recently Created (x2)
  # As a visitor // When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created
  it 'displays the director and movies with attributes - create date ascending' do

    visit "/directors"

    expect(page).to have_content(@stanley.created_at)
    expect(page).to have_content(@wes.created_at)
    expect(@denis.name).to appear_before(@wes.name)
    expect(@wes.name).to appear_before(@stanley.name)
  end

  # User Story 8, Child Index Link
  # As a visitor // When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  it 'displays link to Child Index' do

    visit "/directors"

    click_on "Movies"

    expect(current_path).to eq("/movies")
  end

  # User Story 9, Parent Index Link
  # As a visitor // When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index
  it 'displays link to Parent Index' do

    visit "/directors"

    click_on "Directors"

    expect(current_path).to eq("/directors")
  end
end
