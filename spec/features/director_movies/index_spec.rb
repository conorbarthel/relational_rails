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

  # User Story 5, Parent Children Index (x2)
  # As a visitor // When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes:
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
    # expect(page).to_not have_content(movie_3.length) -- removed becuase it doesn't work if movies have same length
    # expect(page).to_not have_content(movie_3.recently_viewed)-- removed becuase it doesn't work if movies have same length
    # expect(page).to_not have_content(movie_3.genre)-- removed becuase it doesn't work if movies have same genre
  end

  # User Story 13, Parent Child Creation (x2)
  # As a visitor // When I visit a Parent Childs Index page
  # Then I see a link to add a new adoptable child for that parent "Create Child"
  # When I click the link
  # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
  it 'displays link "Add Movie" to /director/:id/movies' do
    visit "/directors/#{@stanley.id}/movies"
    click_on "Add Movie"
    expect(current_path).to eq("/directors/#{@stanley.id}/movies/new")
  end
end
