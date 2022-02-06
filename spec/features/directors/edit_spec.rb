require 'rails_helper'

RSpec.describe 'director edit page', type: :feature do
  before :each do
    @stanley = Director.create!(name: 'Stanley Kubrick', active: false, awards_won: 26)
    @wes = Director.create!(name: 'Wes Anderson', active: true, awards_won: 11)
  end

  # User Story 12, Parent Update (x2)
  # When I fill out the form with updated information
  # And I click the button to submit the form
  # Then a `PATCH` request is sent to '/parents/:id',
  # the parent's info is updated,
  # and I am redirected to the Parent's Show page where I see the parent's updated info
  it 'can edit a director and redirect to the Director Show Page' do
    visit "/directors/#{@stanley.id}"
    click_on "Update Director"

    fill_in(:name, with: 'Stanley Kubrick')
    fill_in(:awards_won, with: 45)
    # check('Active')

    click_button "Submit Updates"

    expect(current_path).to eq("/directors/#{@stanley.id}")
    expect(page).to have_content("Awards Won: 45")
  end
end
